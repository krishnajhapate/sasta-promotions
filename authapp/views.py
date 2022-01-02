from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.contrib.auth import authenticate
from django.contrib import messages
# Create your views here.


def register(request):
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