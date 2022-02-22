from locale import currency
from rest_framework import serializers
from authapp.models import AccountBalance
from orders.models import OrdersModel
from services.models import ServicesModel, CategoryModel


class CategorySerializer(serializers.ModelSerializer):

    class Meta:
        model = CategoryModel
        fields = ("name", )


class OrderSerializer(serializers.ModelSerializer):

    class Meta:
        model = OrdersModel
        fields = ("id", )


class AccountBalanceSerializer(serializers.ModelSerializer):
    currency = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = AccountBalance
        fields = ("money", "currency")

    def get_currency(self, obj):
        return "INR"


class OrderStatusSerializer(serializers.ModelSerializer):

    class Meta:
        model = OrdersModel
        fields = (
            "charge",
            "status",
            "start_count",
            "remains",
        )


class ServicesSerializer(serializers.ModelSerializer):
    category = serializers.SerializerMethodField(read_only=True)
    service = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = ServicesModel
        exclude = (
            'id',
            'api',
            'service_id',
            "active",
            "description",
        )

    def get_category(self, obj):
        return CategoryModel.objects.get(id=obj.category.id).name

    def get_service(self, obj):
        return obj.id
