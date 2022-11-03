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
    key = forms.CharField(max_length=10000, required=False)
    add_id = forms.BooleanField(required=False)

    class Meta:
        model = ServicesModel
        fields = ['name', 'category', 'url', 'key', 'add_id', 'api']


class ServiceAdminAddForm(forms.ModelForm):
    description = forms.CharField(widget=forms.Textarea(attrs={'id': "richtext_field"}))

    class Meta:
        model = ServicesModel
        fields = '__all__'