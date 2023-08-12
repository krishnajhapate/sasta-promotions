# views.py

from rest_framework import generics, permissions, status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken
from django.contrib.auth import get_user_model
from .serializers import *
from authapp.utils import generate_key
from django.contrib.auth import update_session_auth_hash
from datetime import datetime


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


class UserInfo(generics.GenericAPIView):
    serializer_class = UserInfoSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_serializer_context(self):
        # Get the default context from the parent class
        context = super().get_serializer_context()

        # Add the request object to the context
        context['request'] = self.request

        return context

    def get_object(self):
        return self.request.user

    def get_serializer_class(self):
        # Use different serializers based on request method
        if self.request.method == 'GET':
            return UserInfoSerializer
        elif self.request.method == 'POST':
            return UserInfoSerializer
        else:
            return UserInfoSerializer  #

    def get_serializer(self, *args, **kwargs):
        serializer_class = self.get_serializer_class()
        kwargs['context'] = self.get_serializer_context()
        return serializer_class(*args, **kwargs)

    def get(self, request):
        serializer = self.serializer_class(
            'ok', context={'request': request})

        return Response(serializer.data, status=status.HTTP_200_OK)

    def patch(self, request):
        serializer = UserInfoUpdateSerializer(request.user,
                                              data=request.data, partial=True, context={'request': request})

        if serializer.is_valid(raise_exception=True):
            serializer.save()

        return Response(serializer.data, status=status.HTTP_202_ACCEPTED)


class ChangePasswordView(generics.GenericAPIView):
    serializer_class = ChangePasswordSerializer

    def post(self, request):
        serializer = ChangePasswordSerializer(data=request.data)
        if serializer.is_valid():
            user = request.user
            old_password = serializer.validated_data['old_password']
            new_password = serializer.validated_data['new_password']
            if not user.check_password(old_password):
                return Response({"error": "Current password is incorrect."}, status=status.HTTP_400_BAD_REQUEST)
            user.set_password(new_password)
            user.save()
            update_session_auth_hash(request, user)
            return Response({"success": "Password has been changed successfully."})
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class GenerateAPIKeyView(generics.GenericAPIView):
    serializer_class = ChangePasswordSerializer

    def post(self, request):
        user = request.user
        user.api_key = generate_key(35)
        user.api_create_at = datetime.now()
        user.save()
        serializer = UserSerializer(user)
        return Response(serializer.data)
