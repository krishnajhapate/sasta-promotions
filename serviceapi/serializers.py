# myapp/serializers.py

from rest_framework import serializers
from services.models import CategoryModel, ServicesModel, Offers, TicketsModel, MessageModel


class ServiceSerializer(serializers.ModelSerializer):

    class Meta:
        model = ServicesModel
        fields = ('id', 'name', 'min_order', 'max_order', 'description',
                  'rate', 'average_time_hours', 'average_time_minutes')


class CategorySerializer(serializers.ModelSerializer):
    services = serializers.SerializerMethodField()

    class Meta:
        model = CategoryModel
        fields = ('id', 'ranking', 'name', 'services')

    def get_services(self, category):
        keyword = self.context.get('search', None)

        if keyword:
            serializer = ServiceSerializer(ServicesModel.objects.filter(
                name__icontains=keyword, category=category, active=True), many=True)
            return serializer.data

        service = ServicesModel.objects.filter(category=category, active=True)

        if service.count() > 0:
            serializer = ServiceSerializer(service, many=True)
            return serializer.data
        return None

    def to_representation(self, instance):

        data = super().to_representation(instance)

        return data


class UserServiceSerializer(serializers.ModelSerializer):
    rate = serializers.SerializerMethodField()

    class Meta:
        model = ServicesModel
        fields = ('id', 'name', 'min_order', 'max_order', 'description',
                  'rate', 'average_time_hours', 'average_time_minutes', 'ranking')

    def get_rate(self, service):
        user = self.context.get('request').user
        user_offer = None

        try:
            user_offer = Offers.objects.get(user=user, service=service)
        except:
            pass

        if user_offer:
            if user_offer.price is not None and user_offer.offer_type == "Price":
                return service.rate - user_offer.price
            elif user_offer.price is not None and user_offer.offer_type == "Percentage":
                discount_amount = (
                    user_offer.price / 100) * service.rate
                return service.rate - discount_amount

        return service.rate


class UserCategorySerializer(serializers.ModelSerializer):
    services = serializers.SerializerMethodField()

    class Meta:
        model = CategoryModel
        fields = ('id', 'ranking', 'name',  'services', )

    def get_services(self, category):
        keyword = self.context.get('search', None)
        request = self.context.get('request', None)

        if keyword:
            serializer = UserServiceSerializer(ServicesModel.objects.filter(
                name__icontains=keyword, category=category, active=True), many=True, context={'request': request})
            return serializer.data

        service = ServicesModel.objects.filter(category=category, active=True)

        if service.count() > 0:
            serializer = UserServiceSerializer(
                service, many=True, context={'request': request})
            return serializer.data
        return None

    def to_representation(self, instance):
        representation = super().to_representation(instance)

        return representation


class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = MessageModel
        fields = ['ticket', 'user', 'message', 'timestamp',]


class TicketSerializer(serializers.ModelSerializer):
    messages = MessageSerializer(many=True, read_only=True)

    class Meta:
        model = TicketsModel
        fields = ['id', 'user', 'subject',
                  'status', 'created', 'last_updated', 'messages']
