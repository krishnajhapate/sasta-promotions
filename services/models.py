from django.db import models

# Create your models here.


class CategoryModel(models.Model):
    name = models.CharField(max_length=400)
    active = models.BooleanField(default=False)

    def __str__(self) -> str:
        return self.name
    class Meta:
        verbose_name="Categorie"


class ServicesModel(models.Model):
    category = models.ForeignKey(CategoryModel, on_delete=models.CASCADE)
    name = models.CharField(max_length=400)
    min_order = models.IntegerField()
    max_order = models.IntegerField()
    rate = models.IntegerField(help_text="Per 1000 ")
    average_time_hours = models.IntegerField(blank=True, null=True)
    average_time_minutes = models.IntegerField(blank=True, null=True)
    description = models.TextField(max_length=4000, blank=True, null=True)
    service_id = models.IntegerField()
    active = models.BooleanField(default=False)

    def __str__(self) -> str:
        return self.name

    class Meta:
        verbose_name="Service"
