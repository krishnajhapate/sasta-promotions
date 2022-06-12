from django.shortcuts import redirect, render
from django.contrib.auth import authenticate, login as login_func
from django.contrib import messages
from django.contrib.auth import logout
from authapp.models import User
from django.contrib.auth.decorators import login_required
from django.db import transaction
from django.db.models import Q
from django.utils.timezone import now
import random

from authapp.tasks import *
# Create your views here.


def register(request):
    if request.user.is_authenticated:
        return redirect('dashboard')

    if request.method == "POST":
        with transaction.atomic():
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
                        "phone": phone,
                        "name": firstname + " " + lastname
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

            send_welcome_mail.delay(email, firstname)

            user = authenticate(username=username, password=password1)

            if user:
                login_func(request, user)
                return redirect('dashboard')

    return render(request, 'register.html')


def login(request):
    if request.user.is_authenticated:
        return redirect('dashboard')

    # Authenticating
    if request.method == "POST":
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)

        user = authenticate(username=username, password=password)
        if user:
            login_func(request, user)
            return redirect('dashboard')
        else:
            return render(request, 'home.html', {"error": True})

    return render(request, 'home.html')


@login_required
def accounts(request):

    return render(request, 'accounts.html')


def request_password_reset_email(request):
    if request.user.is_authenticated:
        return redirect('dashboard')

    if request.method == "POST":
        username = request.POST.get('usernam', None)

        user = User.objects.filter(Q(username=username) | Q(email=username))

        if not user.exists():
            return render(request, 'email_input.html', {
                "username_error": True,
                "message": "Account not exists"
            })

        user = user.first()
        if user.send_otp_times > 4:
            return render(request, 'email_input.html', {
                "username_error": True,
            })

        user.otp = random.randint()
        user.send_otp_times += 1
        user.save()

        reset_password_mail.delay(user.email, user.firstname, user.otp)

    return render(request, 'email_input.html')


@login_required
def change_password(request):
    if request.method == "POST":
        current_password = request.POST['current_password']
        password = request.POST['password']
        confirm_password = request.POST['confirm_password']
        if password != confirm_password:
            messages.error(
                request,
                "New Password and confirm new password does not match")
        if not request.user.check_password(current_password):
            messages.error(request, "Current password is not correct")

        if request.user.check_password(current_password):
            user = User.objects.get(id=request.user.id)
            user.set_password(password)
            user.save()
            messages.success(request, "Password updated")

    return redirect("accounts")


@login_required
def logout_page(request):
    logout(request)

    return redirect('home')