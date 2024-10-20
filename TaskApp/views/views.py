from django.shortcuts import render
from django.conf import settings
from django.http import HttpResponse

# Create your views here.

def index(request):
    context = {
        'URL': settings.BASE_URL,
    }
    return render(request, 'TaskApp/index.html', context)

