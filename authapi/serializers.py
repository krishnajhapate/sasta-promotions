# serializers.py

from rest_framework import serializers
from django.contrib.auth import get_user_model
from authapp.models import AccountBalance
from orders.models import OrdersModel

User = get_user_model()


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('username', 'name', 'phone',
                  'api_key', 'email', 'password')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        password = validated_data.pop('password', None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password)
        instance.save()
        return instance


class UserInfoSerializer(serializers.Serializer):
    total_orders = serializers.SerializerMethodField()
    account_balance = serializers.SerializerMethodField()
    spent_balance = serializers.SerializerMethodField()
    username = serializers.SerializerMethodField()

    def get_account_balance(self, obj):
        user = self.context['request'].user
        return round(AccountBalance.objects.get(user=user).money, 2)

    def get_total_orders(self, obj):
        return OrdersModel.objects.all().count()

    def get_spent_balance(self, obj):
        user = self.context['request'].user
        balance = OrdersModel.objects.filter(
            user=user).exclude(status="Cancelled")
        total = 0
        for i in balance:
            total += i.charge
        return round(total, 2)

    def get_username(self, obj):
        return self.context['request'].user.username
