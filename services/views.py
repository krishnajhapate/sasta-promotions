from django.shortcuts import render, redirect
from django.urls import reverse
from rest_framework import serializers
from rest_framework.response import Response
from rest_framework.views import APIView
from services.models import CategoryModel, MessageModel, ServicesModel, TicketsModel
from services.serializers import CategorySerializer, ServicesSerializer
from services.utils import get_ser

# Create your views here.


def services(request):
    search = request.GET.get('search')
    cat = request.GET.get('cat')
    categories = CategoryModel.objects.filter(active=True).order_by('ranking')

    services = []
    for category in categories:
        service = ServicesModel.objects.filter(active=True, category=category)
        if service.count() > 0:
            category.services = service
            services.append(category)

    return render(request, 'services.html', {"categories": services})


def tickets(request):
    if request.method == "POST":
        message = request.POST.get('message', None)
        subject = request.POST.get('subject', None)
        ticket = TicketsModel.objects.create(user=request.user,
                                             subject=subject)
        message_create = MessageModel.objects.create(user=request.user,
                                                     message=message,
                                                     ticket=ticket)
        return redirect("tickets")

    tickets = TicketsModel.objects.filter(
        user=request.user).order_by('-created')

    return render(request, "tickets.html", {"tickets": tickets})


def view_tickets(request, id=None):
    # try:

    ticket = TicketsModel.objects.get(id=id)
    if request.method == "POST":
        message = request.POST.get('message', None)
        message_create = MessageModel.objects.create(user=request.user,
                                                     message=message,
                                                     ticket=ticket)
        return redirect(reverse("view_ticket", kwargs={"id": id}))

    messages = MessageModel.objects.filter(ticket=ticket).order_by('timestamp')

    return render(request, "view_tickets.html", {
        "messages": messages,
        "ticket": ticket
    })


class ServicesView(APIView):

    def get(self, request, format=None):
        """
        Return a list of all users.
        """
        serializer = ServicesSerializer(get_ser(request), many=True)
        return Response(serializer.data)


class CategoriesView(APIView):

    def get(self, request, format=None):
        """
        Return a list of all users.
        """
        service = CategoryModel.objects.filter(active=True).order_by('id')
        serializer = CategorySerializer(service, many=True)
        return Response(serializer.data)