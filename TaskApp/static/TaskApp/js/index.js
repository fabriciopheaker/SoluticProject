
async function modalCustomer() {

  let html = `
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
    }
  }).then(async (result) => {
    if (result.isConfirmed) {

      let name = $('#REGISTER_NAME').val();
      let address = $('#REGISTER_ADDRESS').val();
      let phone = $('#REGISTER_PHONE').val();
      let email = $('#REGISTER_EMAIL').val();

      if (name && address && phone && email) {
        const Employee = {
          NAME: name,
          ADDRESS: address,
          PHONE: phone,
          EMAIL: email,
        }
        loading();
        return RegisterCustomer(Employee);
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




async function RegisterCustomer(data) {

  let response = await PostDados('admin/comercial/produtos', JSON.stringify(dados));
  if (response.data.status == 'success') {
    window.location.href = url + `/admin/comercial/produtos`
  }
  statusAlert(response);

}
