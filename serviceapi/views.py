# myapp/views.py

from rest_framework import generics, permissions, status
from services.models import CategoryModel, TicketsModel, MessageModel
from .serializers import CategorySerializer, UserCategorySerializer, TicketSerializer, MessageSerializer
from rest_framework.response import Response
from rest_framework.views import APIView
from django.shortcuts import get_object_or_404


class CategoryListAPIView(generics.ListAPIView):
    queryset = CategoryModel.objects.all().order_by('ranking')
    serializer_class = CategorySerializer
    permission_classes = [permissions.AllowAny]

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context['search'] = self.request.query_params.get('search', None)
        return context


class UserCategoryListAPIView(generics.ListAPIView):
    queryset = CategoryModel.objects.filter(active=True).order_by('ranking')
    serializer_class = UserCategorySerializer

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context['search'] = self.request.query_params.get('search', None)
        context['request'] = self.request

        return context


class TicketsAPIView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, format=None):
        message = request.data.get('message', None)
        subject = request.data.get('subject', None)
        ticket = TicketsModel.objects.create(
            user=request.user, subject=subject)
        message_create = MessageModel.objects.create(
            user=request.user, message=message, ticket=ticket)
        return Response({"message": "Successfully created ticket"}, status=status.HTTP_201_CREATED)

    def get(self, request, format=None):
        tickets = TicketsModel.objects.filter(
            user=request.user).order_by('-created')
        serializer = TicketSerializer(tickets, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


class ViewTicketsAPIView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, id=None, format=None):
        ticket = get_object_or_404(TicketsModel, id=id)
        message = request.data.get('message', None)
        message_create = MessageModel.objects.create(
            user=request.user, message=message, ticket=ticket)
        return Response({"message": "Successfully created"}, status=status.HTTP_201_CREATED)

    def get(self, request, id=None, format=None):
        ticket = get_object_or_404(TicketsModel, id=id)
        messages = MessageModel.objects.filter(
            ticket=ticket).order_by('timestamp')
        serializer = MessageSerializer(messages, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
