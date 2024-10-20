from django.urls import path
import TaskApp.views.views as taskview
import TaskApp.views.customer as customerview
from TaskApp.views import customer

urlpatterns = [

    path('', taskview.index),
    path('list/', customerview.index),

    path ('registerCustomer/',customerview.store),
]

