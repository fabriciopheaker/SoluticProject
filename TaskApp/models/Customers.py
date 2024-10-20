from django.db import models

class Customer(models.Model):

    name = models.CharField(max_length=100)
    address = models.CharField(max_length=150)
    email = models.EmailField()
    phone = models.CharField(max_length=15)
    date_created = models.DateTimeField(auto_now_add=True)


    def __str__(self):
        return f"{self.name} - {self.email} - {self.phone}"