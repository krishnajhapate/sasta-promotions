from django.http.response import HttpResponse
from django.shortcuts import render

# Create your views here.


def register(request):
    return render(request, 'register.html')


def login(request):
    return render(request, 'home.html')