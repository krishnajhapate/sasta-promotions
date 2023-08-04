# myapp/views.py

from rest_framework import generics, permissions
from services.models import CategoryModel
from .serializers import CategorySerializer, UserCategorySerializer


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
