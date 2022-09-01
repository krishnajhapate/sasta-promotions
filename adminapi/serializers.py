from rest_framework import serializers


class StatisticsSerializer(serializers.Serializer):
    total_users = serializers.IntegerField()
    total_amounts = serializers.FloatField()
    total_orders = serializers.IntegerField()
    total_tickets = serializers.IntegerField()
    total_user_balance = serializers.FloatField()
    total_providers_balance = serializers.FloatField()
    total_profit_today = serializers.FloatField()
    total_profit_30_days = serializers.FloatField()

    class Meta:
        fields = ('total_users', 'total_amounts', 'total_orders',
                  'total_tickets', 'total_user_balance',
                  'total_providers_balance', 'total_profit_today',
                  'total_profit_30_days')
