from django import forms
from .models import *



class SettingsAdminAddForm(forms.ModelForm):
    promotional_description = forms.CharField(widget=forms.Textarea(attrs={'id': "richtext_field"}))

    class Meta:
        model = Settings
        fields = '__all__'

class TutorialsAdminAddForm(forms.ModelForm):
    description = forms.CharField(widget=forms.Textarea(attrs={'id': "richtext_field"}))

    class Meta:
        model = Tutorials
        fields = '__all__'