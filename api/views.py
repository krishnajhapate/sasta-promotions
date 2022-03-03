from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import *
from rest_framework import status
from api.utils import *

# Create your views here.


class AppApi(APIView):

    def get(self, request):
        user = get_user(request)
        key = request.GET.get('key', None)

        if key == None:
            return Response("Invaild Api key ",
                            status=status.HTTP_400_BAD_REQUEST)

        if user != None:
            action = request.GET.get("action", None)

            if action == "services":
                serializer = ServicesSerializer(get_ser(user), many=True)
                return Response(serializer.data)

            if action == "add":
                order = place_order(request, user)
                print(order)
                if order[0]:
                    serializer = OrderSerializer(instance=order[0])
                    return Response({"order": serializer.data['id']})

                return Response(order[1], status=status.HTTP_400_BAD_REQUEST)

            if action == "status":
                order = order_status(request, user)
                if order[0]:
                    serializer = OrderStatusSerializer(instance=order[0])
                    return Response(serializer.data)

                return Response(order[1], status=status.HTTP_400_BAD_REQUEST)

            if action == "balance":
                account_bal = account_status(request, user)
                print(account_bal)
                if account_bal[0]:
                    serializer = AccountBalanceSerializer(
                        instance=account_bal[0])
                    return Response(serializer.data)

                return Response(account_bal[1],
                                status=status.HTTP_400_BAD_REQUEST)

        return Response("Invaild Request ", status=status.HTTP_400_BAD_REQUEST)
