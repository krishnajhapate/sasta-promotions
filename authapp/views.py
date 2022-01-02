from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.contrib.auth import authenticate
from django.contrib import messages

from authapp.models import User
# Create your views here.


def register(request):
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
            return render(request, 'register.html', {"email_error": True})

        user = User.objects.filter(username=username)
        if user.count() > 0:
            return render(request, 'register.html', {"username_error": True})

        user_create = User.objects.create(
            username=username,
            email=email,
            phone=phone,
            first_name=firstname,
            last_name=lastname,
        )
        user_create.set_password(password1)
        user_create.save()
        return HttpResponse("User Created")

    return render(request, 'register.html')


def login(request):
    # if request.user:
    #     return redirect('home')

    # Authenticating
    if request.method == "POST":
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)

        user = authenticate(username=username, password=password)
        if user is not None:
            return redirect('home')
        else:
            return render(request, 'home.html', {"error": True})

    return render(request, 'home.html')