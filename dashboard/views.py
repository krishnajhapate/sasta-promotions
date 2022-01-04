from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required 
# Create your views here.


def home_page(request):
    if request.user:
        return redirect('dashboard')
    return render(request, "home.html")

@login_required
def dashboard(request):
    return render(request, "dashboard.html")


def about_page(request):
    return render(request, "about.html")


def terms_and_condition_page(request):
    return render(request, "terms.html")
