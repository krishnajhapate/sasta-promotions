from django.shortcuts import render
from rest_framework import serializers
from rest_framework.response import Response
from rest_framework.views import APIView
from services.models import CategoryModel, ServicesModel
from services.serializers import CategorySerializer, ServicesSerializer

# Create your views here.


def services(request):
    search = request.GET.get('search')
    cat = request.GET.get('cat')
    categories = CategoryModel.objects.filter(active=True)

    print(categories)
    services = []
    for category in categories:
        service = ServicesModel.objects.filter(active=True, category=category)
        if service.count() > 0:
            category.services = service
            services.append(category)

    return render(request, 'services.html', {"categories": services})


class ServicesView(APIView):

    def get(self, request, format=None):
        """
        Return a list of all users.
        """
        service = ServicesModel.objects.filter(active=True)
        serializer = ServicesSerializer(service, many=True)
        return Response(serializer.data)


class CategoriesView(APIView):

    def get(self, request, format=None):
        """
        Return a list of all users.
        """
        service = CategoryModel.objects.filter(active=True)
        serializer = CategorySerializer(service, many=True)
        return Response(serializer.data)