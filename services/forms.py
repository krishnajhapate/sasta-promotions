from django import forms
from .models import CategoryModel, ServicesModel


class ServiceAddForm(forms.ModelForm):
    url = forms.CharField(max_length=400)

    class Meta:
        model = CategoryModel
        fields = ['name', 'active', 'url']

    def save(self, commit=True):
        user = super(ServiceAddForm, self).save(commit=False)
        user.set_password(self.cleaned_data['password2'])
        if commit:
            user.save()
        return user