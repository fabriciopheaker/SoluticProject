from TaskApp.models.Customers import Customer

class CustomerRepository:

    def getAllCustomers(self):
        customers = Customer.objects.all().values()
        return list(customers)


    def createCustomer(data):
        try:
            customer = Customer.objects.create(
                name=data['NAME'].upper(),
                address=data['ADDRESS'].upper(),
                phone=data['PHONE'].upper(),
                email=data['EMAIL'].upper()
            )
            return customer.id
        except Exception as e:
         return False