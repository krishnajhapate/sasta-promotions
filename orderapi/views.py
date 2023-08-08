# views.py
from rest_framework import generics, permissions, status
from rest_framework.response import Response
from orders.models import OrdersModel, TransanctionsModel
from .serializers import OrderSerializer, OrdersGetSerializer, FundAddSerializer


class OrderCreateView(generics.GenericAPIView):
    queryset = OrdersModel.objects.all()
    serializer_class = OrderSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_serializer_class(self):
        # Use different serializers based on request method
        if self.request.method == 'GET':
            return OrdersGetSerializer
        elif self.request.method == 'POST':
            return OrderSerializer
        else:
            return OrderSerializer  #

    def get(self, request):

        orders = OrdersModel.objects.filter(user=request.user)

        serializer = OrdersGetSerializer(orders, many=True)

        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(
            data=request.data, context={'request': request})

        if serializer.is_valid(raise_exception=True):
            serializer.save()

        return Response(serializer.data, status=status.HTTP_201_CREATED)


class FundAddView(generics.GenericAPIView):
    serializer_class = FundAddSerializer

    def post(self, request):
        serializer = FundAddSerializer(
            data=request.data, context={'request': request})

        if serializer.is_valid(raise_exception=True):
            serializer.save()
            return Response({"success": "Funds added successfully."})
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
