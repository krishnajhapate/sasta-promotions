# myapp/serializers.py

from rest_framework import serializers
from dashboard.models import Settings

class SettingsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Settings
        fields = '__all__'
