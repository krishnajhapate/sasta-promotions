# serializers.py
from rest_framework import serializers
from orders.models import OrdersModel, TransanctionsModel
from services.models import Offers
from authapp.models import AccountBalance
from dashboard.models import Settings
import requests
import json


class OrderSerializer(serializers.ModelSerializer):
    # used serializers to create order of user
    balance = serializers.SerializerMethodField(read_only=True)
    service_name = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = OrdersModel
        fields = ('id', 'charge', 'service', 'service_name',
                  'link', 'quantity', 'balance')

    def create(self, validated_data):
        # Retrieve the current authenticated user
        user = self.context['request'].user
        service = validated_data['service']
        quantity = validated_data['quantity']
        link = validated_data['link']

        if quantity < service.min_order or quantity > service.max_order:
            raise serializers.ValidationError(
                f"Quantity must be between {service.min_order} and {service.max_order}.")

        order = OrdersModel.objects.filter(
            service=service,
            link=link,
            user=user,
            status__in=["Processing", "In progress", "Pending",],
        )
        # Add the user to the validated data before creating the order
        if order.exists():
            raise serializers.ValidationError(
                "Already active order with this service and link")

        offers_obj = Offers.objects.filter(user=user)

        offers = offers_obj.filter(service=service)

        offers = Offers.objects.filter(user=user, service=service)

        if offers_obj.filter(offer_type="Percentage",
                             service__isnull=True).exists():
            offer_price = offers_obj.filter(offer_type="Percentage",
                                            service__isnull=True).first()
            service.rate = service.rate - \
                (service.rate * offer_price.price) / 100

        else:
            if offers.exists():
                service = offers.first().service
                if offers.first().offer_type == "Percentage":
                    service.rate = service.rate - (service.rate *
                                                   offers.first().price) / 100
                else:
                    service.rate = offers.first().price

        charge = (service.rate * float(quantity)) / 1000
        account_balance = AccountBalance.objects.get(user=user)

        if charge > account_balance.money:
            raise serializers.ValidationError(
                "Insufficient account balance to make this order")

        validated_data['user'] = user
        validated_data['charge'] = charge
        # Perform any additional custom logic here if needed
        # ...

        # Create the order
        order = OrdersModel.objects.create(**validated_data)

        return order

    def validate_quantity(self, value,):
        if value <= 0:
            raise serializers.ValidationError(
                "Quantity must be greater than zero.")
        return value

    def validate_link(self, value):
        if not value.startswith("http"):
            raise serializers.ValidationError("Link is not correct")
        return value

    def get_balance(self, obj):
        user = self.context['request'].user

        return AccountBalance.objects.get(user=user).money

    def get_service_name(self, obj):
        return obj.service.name


class OrdersGetSerializer(serializers.ModelSerializer):
    # used serializer to give response of all orders

    class Meta:
        model = OrdersModel
        fields = '__all__'


class FundAddSerializer(serializers.ModelSerializer):

    class Meta:
        model = TransanctionsModel
        fields = ['amount', 'transaction_id', 'created', 'id']

    def create(self, validated_data):
        transaction_id = validated_data['transaction_id']
        amount = validated_data['amount']

        transaction = TransanctionsModel.objects.filter(
            transaction_id=transaction_id)
        print(transaction, 'rt', amount)

        if transaction.exists():
            raise serializers.ValidationError("Duplicate transaction id")

        user = self.context['request'].user
        settings = Settings.objects.all().first()  # getting merchant settings
        transaction = None

        data = {"MID": settings.paytm_merchant_id, "ORDERID": transaction_id}

        url = "https://securegw.paytm.in/merchant-status/getTxnStatus"

        # calling api to paytm to check status
        res = requests.post(
            url=url,
            data=json.dumps(data),
        )
        res = res.json()
        print(res)

        if res['STATUS'] == "TXN_FAILURE":
            raise serializers.ValidationError(
                "Order id invalid")

        elif float(res['TXNAMOUNT']) == float(
                amount) and res['STATUS'] == "TXN_SUCCESS":  # success transactions

            transaction = TransanctionsModel.objects.create(
                user=user,
                amount=float(amount),
                transaction_id=transaction_id,
                status="Approved",
            )

            return transaction
        elif res['STATUS'] == "TXN_SUCCESS":
            raise serializers.ValidationError(
                "Payment amount not matched")
        else:
            raise serializers.ValidationError(
                "Something went wrong please try again later!")

        return transaction

    # def validate_transaction_id(self, value):
    #     transaction = TransanctionsModel.objects.filter(transaction_id=value)
    #     if transaction.exists():
    #         raise serializers.ValidationError("Duplicate transaction id")

    #     return value
