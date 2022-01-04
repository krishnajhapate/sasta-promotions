from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.contrib.auth import authenticate
from django.contrib import messages
from django.contrib.auth import logout
from authapp.models import User
from django.contrib.auth.decorators import login_required
# Create your views here.


def register(request):
    # print(request.user, "here")
    if request.user.is_authenticated:
        return redirect('dashboard')

    if request.method == "POST":
        username = request.POST.get('username', None)
        password1 = request.POST.get('password1', None)
        password2 = request.POST.get('password_confirm', None)
        firstname = request.POST.get('first_name', None)
        lastname = request.POST.get('last_name', None)
        phone = request.POST.get('phone', None)
        email = request.POST.get('email', None)

        user = User.objects.filter(email=email)
        if user.count() > 0:
            return render(
                request, 'register.html', {
                    "email_error": True,
                    "email": email,
                    "first_name": firstname,
                    "last_name": lastname,
                    "phone": phone
                })

        user = User.objects.filter(username=username)
        if user.count() > 0:
            return render(
                request, 'register.html', {
                    "username_error": True,
                    "email": email,
                    "first_name": firstname,
                    "last_name": lastname,
                    "phone": phone,
                })
        if password1 != password2:
            return render(
                request, 'register.html', {
                    "password_error": True,
                    "email": email,
                    "first_name": firstname,
                    "last_name": lastname,
                    'username': username,
                    "phone": phone
                })

        user_create = User.objects.create(
            username=username,
            email=email,
            phone=phone,
            first_name=firstname,
            last_name=lastname,
        )
        user_create.set_password(password1)
        user_create.save()
        return redirect('dashboard')


    return render(request, 'register.html')


def login(request):
    if request.user.is_authenticated:
        return redirect('dashboard')

    # Authenticating
    if request.method == "POST":
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)

        user = authenticate(request, username=username, password=password)
        if user is not None:
        
            return redirect('dashboard')
        else:
            return render(request, 'home.html', {"error": True})

    return render(request, 'home.html')


@login_required
def logout_page(request):
    logout(request)

    return redirect('home')