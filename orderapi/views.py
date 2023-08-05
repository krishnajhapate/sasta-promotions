# views.py
from rest_framework import generics, permissions, status
from rest_framework.response import Response
from orders.models import OrdersModel
from .serializers import OrderSerializer


class OrderCreateView(generics.GenericAPIView):
    queryset = OrdersModel.objects.all()
    serializer_class = OrderSerializer
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(
            data=request.data, context={'request': request})

        if serializer.is_valid(raise_exception=True):
            serializer.save()

        return Response(serializer.data, status=status.HTTP_201_CREATED)
