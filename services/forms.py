from django import forms
from .models import CategoryModel, ServicesModel

CHOICES = (
    ("self", "self"),
    ("other", "other"),
)


class ServiceAddForm(forms.ModelForm):
    url = forms.CharField(max_length=400)
    pannel = forms.ChoiceField(choices=CHOICES)
    name = forms.CharField(max_length=500, required=False)

    class Meta:
        model = ServicesModel
        fields = ['name', 'category', 'url']
