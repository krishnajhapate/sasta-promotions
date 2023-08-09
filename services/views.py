from django.contrib import messages
from django.shortcuts import render, redirect
from django.urls import reverse
from rest_framework import serializers
from rest_framework.response import Response
from rest_framework.views import APIView
from services.forms import ServiceAddForm
from services.models import CategoryModel, MessageModel, ServicesModel, TicketsModel
from orders.models import OrdersModel
from django.db.models import Q
from orders.models import OrderTransanctionModel
from authapp.models import AccountBalance
from services.serializers import CategorySerializer, ServicesSerializer
from services.utils import get_ser
import requests

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
        orders_obj = OrdersModel.objects.filter(Q(status="Cancelled"))

        for i in orders_obj:
            if i.last_updated.strftime('%Y-%m-%d %H:%M:%S') == i.order_placed.strftime('%Y-%m-%d %H:%M:%S'):
                i.save()

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


def add_new_service(request):
    if not request.user.is_superuser:
        return redirect('home')

    form = ServiceAddForm()
    if request.method == "POST":
        form = ServiceAddForm(data=request.POST)
        if form.is_valid():
            category = form.cleaned_data['category']
            name = form.cleaned_data['name']
            url = form.cleaned_data['url']
            pannel = form.cleaned_data['pannel']
            key = form.cleaned_data['key']
            api = form.cleaned_data['api']
            add_id = form.cleaned_data['add_id']

            print(category, name, url, pannel)
            data_added = 0
            # send request to url
            if pannel:
                url = f"{url}?key={key}&action=services"
                res = requests.get(url, params=request.GET)
                res = res.json()
                # print(res)
                for i in res:
                    if name == i['category']:
                        service, created = ServicesModel.objects.get_or_create(
                            category=category,
                            name=i['name'],
                            rate=i['rate'],
                            min_order=i['min'],
                            max_order=i['max'],
                            refill=i['refill'],
                            # description=i['description'],
                            active=True,
                        )
                        data_added += 1
                        if add_id:
                            service.service_id = i['service']
                            service.save()
                        if api:
                            service.api = api
                            service.save()
                        print(created)
                        # print(res)
                # extracting categorys

                pass
            messages.success(request, f"Added {data_added} service")
    return render(request, 'add-service.html', {"form": form})
