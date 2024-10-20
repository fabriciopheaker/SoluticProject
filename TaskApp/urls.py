from django.contrib import admin
from django.urls import path
import TaskApp.views

urlpatterns = [

    path('rota/', TaskApp.views.home)
]
