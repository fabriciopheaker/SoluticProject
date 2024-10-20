from django.contrib import admin
from django.urls import path
import TaskApp.views as taskapp

urlpatterns = [

    path('', taskapp.index),

    ]

