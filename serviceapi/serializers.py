# myapp/serializers.py

from rest_framework import serializers
from services.models import CategoryModel, ServicesModel

class ServiceSerializer(serializers.ModelSerializer):

    class Meta:
        model = ServicesModel
        fields = ('id', 'name','min_order','max_order','description','rate','average_time_hours','average_time_minutes')

class CategorySerializer(serializers.ModelSerializer):
    services =serializers.SerializerMethodField()         

    class Meta:
        model = CategoryModel
        fields = ('id','ranking', 'name', 'services')

    def get_services(self, category):
        keyword = self.context.get('search', None)

        if keyword:
            serializer = ServiceSerializer(ServicesModel.objects.filter(name__icontains=keyword, category=category,active=True),many=True)
            return serializer.data


        service = ServicesModel.objects.filter(category=category,active=True)

        if service.count() > 0:
            serializer = ServiceSerializer(service,many=True)
            return serializer.data
        return None
    
    def to_representation(self, instance):

        data = super().to_representation(instance)

        return data
