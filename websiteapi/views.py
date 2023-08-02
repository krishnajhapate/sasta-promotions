# myapp/views.py

from rest_framework import generics, permissions
from rest_framework.views import APIView
from rest_framework.response import Response


from dashboard.models import Settings
from .serializers import SettingsSerializer


class WebsiteInfo(APIView):
    permission_classes = [permissions.AllowAny]

    def get(self, request, format=None):
        # Get the first instance of the model
        first_settings = Settings.objects.first()

        # Serialize the data
        serializer = SettingsSerializer(first_settings)

        return Response(serializer.data)
