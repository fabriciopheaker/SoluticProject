
$(document).ready(() =>{


  $('#SEARCH').click(async (e) => {
        e.preventDefault();

        await getCustomerRecords();
  })



  CustomerRecords(null)

})


async function modalCustomer() {

  let html = `
<form>
 <input type="hidden" name="csrfmiddlewaretoken" value="${csrfToken}">
      <div class="row my-2">
          <div class="col-12">
              <div class="col-md-3  d-flex justify-content-start">
                  <label class="form-label text-white" for="Nome">Nome:</label>
              </div>
              <div class="col-md-12 mb-2">
                  <input type="text"  id="REGISTER_NAME" class="form-control" >
              </div>
          </div>
          <div class="col-12">
              <div class="col-md-3  d-flex justify-content-start">
                  <label class="form-label text-white" for="endereco">Endereço:</label>
              </div>
              <div class="col-md-12 mb-2">
                  <input type="text" id="REGISTER_ADDRESS" class="form-control">              
              </div>
          </div>
    
    
          <div class="col-12">
              <div class="col-md-3 d-flex justify-content-start">
                  <label class="form-label  text-white" >Telefone:</label>
              </div>
              <div class="col-md-12 mb-2">
                  <input type="text" id="REGISTER_PHONE" class="form-control">      
              </div>
          </div>
          
          <div class="col-12">
              <div class="col-md-3 d-flex justify-content-start">
                  <label class="form-label  text-white" >Email:</label>
              </div>
              <div class="col-md-12 mb-2">
                  <input type="email" id="REGISTER_EMAIL" class="form-control">      
              </div>
          </div>
    </div>
</form>
`
  Swal.fire({
    title: "<h2 class='text-white'>Cliente</h2>",
    icon: "info",
    html: html,
    confirmButtonText: 'Cadastrar',
    confirmButtonColor: '#3688fc',
    background: '#313a46',
    cancelButtonColor: '#d33',
    cancelButtonText: 'Cancelar',
    showCancelButton: true,
    reverseButtons: true,
    didRender: () => {

      //Apply Mask Phone
      $('#REGISTER_PHONE').mask('(00) 00000-0000');

      // Apply Uppercase
      $('#REGISTER_NAME').on('input', function () {
        $(this).val($(this).val().toUpperCase());
      });

      $('#REGISTER_ADDRESS').on('input', function () {
        $(this).val($(this).val().toUpperCase());
      });


    }
  }).then(async (result) => {
    if (result.isConfirmed) {

      let name = $('#REGISTER_NAME').val();
      let address = $('#REGISTER_ADDRESS').val();
      let phone = $('#REGISTER_PHONE').val();
      let email = $('#REGISTER_EMAIL').val();


    let mailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

      if(!mailPattern.test(email))
      {
        return Swal.fire({
            icon: "error",
            title: "Atenção",
            text: 'Email Inválido! Preencha Corretamente.',
            confirmButtonColor: "#df2b2b",
        });
      }

     if (name && address && phone && email) {
        const Customer = {
          NAME: name,
          ADDRESS: address,
          PHONE: phone,
          EMAIL: email,
        }
        loading();
        return RegisterCustomer(Customer);
      } else {
        return Swal.fire({
          icon: "error",
          title: "Atenção",
          text: 'Por favor, Preencha todos os dados',
          confirmButtonColor: "#df2b2b",
        });
      }
    }
  });

}


async function RegisterCustomer(customer) {
  let response = await PostDados('registerCustomer/', JSON.stringify(customer));
  if (response.data.status == 'success') {

    tabela = $('#TableCustomers').DataTable();
    tabela.row.add({
      'id': response.data.customer_id,
      'name': customer.NAME,
      'address': customer.ADDRESS,
      'phone': customer.PHONE,
      'email': customer.EMAIL,
    }).draw();

  }
  statusAlert(response);

}




async function getCustomerRecords()
{
      loading();
      let name = $('#CUSTOMER_SEARCH').val();
      let Customer = {
          NAME: name,
      }

      let response = await getDados('list/', Customer);
      Swal.close();
      return CustomerRecords(response.data);


}

function CustomerRecords(dataCustomer) {
      if ($.fn.DataTable.isDataTable('#TableCustomers')) {

        $('#TableCustomers').DataTable().destroy();
      }



        $('#TableCustomers').DataTable( {
                  data: dataCustomer,
                  language: {

                    url: 'TaskApp/static/TaskApp/libs/datatables.net/lang/portugues-br.json',
                    emptyTable: "Nenhum dado disponível na tabela", // Mensagem quando não há dados
                    zeroRecords: "Nenhum registro encontrado com essa pesquisa" // Mensagem quando a pesquisa não retorna resultados

                  },
                  lengthMenu: [
                      [10, 25, 50, 100, -1], // Valores numéricos
                      [10, 25, 50, 100, "Todos"],// Labels correspondentes
                  ] ,

                   buttons:
                       [
                           {
                                extend: 'copy',
                                text: '<i class="ri-file-copy-line"></i>', // Ícone de copiar
                                titleAttr: 'Copiar' // Dica de ferramenta
                            },
                            {
                                extend: 'csv',
                                text: '<i class="ri-file-excel-2-fill"></i>', // Ícone de CSV
                                titleAttr: 'Exportar CSV' // Dica de ferramenta
                            },
                            {
                                extend: 'print',
                                text: '<i class="ri-printer-fill"></i>', // Ícone de Imprimir
                                titleAttr: 'Imprimir' // Dica de ferramenta
                            }
                        ],
                   dom: 'lBfrtip',


                   columnDefs: [
                        { "className": "text-wrap", "targets": "_all" }
                    ],
                   responsive: true,
                   columns:
                       [
                            {
                              title: 'ID',
                              data: 'id',
                            },
                            {
                             title: 'NOME',
                              data: 'name',
                            },
                            {
                              title: 'ENDEREÇO',
                              data: 'address',
                            },
                            {
                              title: 'TELEFONE',
                              data: 'phone',
                            },
                            {
                              title: 'EMAIL',
                              data: 'email',
                            },
                       ]
        });

}















