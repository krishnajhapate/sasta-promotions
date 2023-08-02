# views.py

from rest_framework import generics, permissions, status
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from django.contrib.auth import get_user_model
from .serializers import UserSerializer

User = get_user_model()


class UserRegistrationView(generics.CreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [permissions.AllowAny]


class UserLoginView(generics.GenericAPIView):
    serializer_class = UserSerializer
    permission_classes = [permissions.AllowAny]

    def post(self, request):
        username = request.data.get('username')

        user = User.objects.filter(username=username)
        if not user.count() > 0:
            return Response(
                {'error': 'No User found'},
                status=status.HTTP_400_BAD_REQUEST
            )
        user = user.first()
        # If using Django's built-in User model, it has `check_password` method for password validation
        if not user.check_password(request.data.get('password')):
            return Response(
                {'error': 'Invalid credentials'},
                status=status.HTTP_401_UNAUTHORIZED
            )

        refresh = RefreshToken.for_user(user)
        return Response(
            {
                'refresh': str(refresh),
                'access': str(refresh.access_token),
                'data': self.serializer_class(user).data
            },
            status=status.HTTP_200_OK,
        )
