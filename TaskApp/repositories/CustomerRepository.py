from TaskApp.models.Customers import Customer

class CustomerRepository:

    def getAllCustomers(self, nameSearch=None):
        if(nameSearch):
            customer = Customer.objects.filter(name__icontains=nameSearch)
        else:
            customer = Customer.objects.all()

        return list(customer.values('id','name','email','address','phone'))



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