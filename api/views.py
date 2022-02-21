from rest_framework.response import Response
from rest_framework.views import APIView
from services.serializers import ServicesSerializer
from rest_framework import status
from api.utils import get_user
from services.utils import get_ser

# Create your views here.


class AppApi(APIView):

    def get(request):
        user = get_user(request)
        if user:
            serializer = ServicesSerializer(get_ser(user), many=True)
            return Response(serializer.data)

        return Response("Invaild Api key ", status=status.HTTP_400_BAD_REQUEST)
