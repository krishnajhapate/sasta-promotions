from django import forms
from .models import Settings



class SettingsAdminAddForm(forms.ModelForm):
    promotional_description = forms.CharField(widget=forms.Textarea(attrs={'id': "richtext_field"}))

    class Meta:
        model = Settings
        fields = '__all__'