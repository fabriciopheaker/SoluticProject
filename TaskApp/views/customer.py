# from django.shortcuts import render
import re
import json

from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse , HttpResponse
from django.core.exceptions import ValidationError
from TaskApp.repositories.CustomerRepository import CustomerRepository


def index(request):
    customers = CustomerRepository.getAllCustomers(request)
    return JsonResponse(customers, safe=False)




@csrf_exempt
def store(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            validator(data)

            customer = CustomerRepository.createCustomer(data)

            response = {
                'status': 'success',
                'message': 'Cadastro realizado com sucesso.',
                'customer_id': customer,
            }

            return JsonResponse(response)

        except ValidationError as e:

            response = {
                'status': 'error',
                'message': str(e),
            }
            return JsonResponse(response, status=400)

        except Exception as e:

            response = {
                'status': 'error',
                'message': 'Erro ao cadastrar o cliente.',
                'error' : e
            }
            return JsonResponse(response, status=500)

    return JsonResponse({'status': 'error', 'message': 'Método não permitido.'}, status=405)


def validator(data):

    if not data.get('NAME'):
        raise ValidationError("O nome é obrigatório.")

    if not data.get('ADDRESS'):
        raise ValidationError("O endereço é obrigatório.")

    email = data.get('EMAIL')

    if not email:
        raise ValidationError("O email é obrigatório.")

    if not re.match(r"[^@]+@[^@]+\.[^@]+", email):
        raise ValidationError("O email fornecido não é válido.")

    phone = data.get('PHONE')

    if not phone:
        raise ValidationError("O telefone é obrigatório.")

    if not re.match(r"^\+?1?\d{9,15}$", phone):
        raise ValidationError("O telefone fornecido não é válido.")

    return True