from django.db import models
from rest_framework import serializers
from .models import ServicesModel, CategoryModel


class CategorySerializer(serializers.ModelSerializer):

    class Meta:
        model = CategoryModel
        fields = "__all__"


class ServicesSerializer(serializers.ModelSerializer):
    # category = CategorySerializer(read_only=True)

    class Meta:
        model = ServicesModel
        fields = "__all__"