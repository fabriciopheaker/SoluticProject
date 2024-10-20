
let maxTentativa = 3; // Fora da função getDados para manter o estado

async function getDados(uri, parametros = {}, tentativas = maxTentativa) {
  const requestURL = url + `/${uri}`;
  try {
    const response = await axios.get(requestURL, {
      params: parametros
    });
    return response.data;
  } catch (error) {
    if (tentativas > 0) {
      const tempoEspera = (maxTentativa - tentativas + 1) * 1000;
      // Tentar novamente chamando a função getDados após o tempo de espera calculado
      await new Promise(resolve => setTimeout(resolve, tempoEspera));
      return getDados(uri, parametros, tentativas - 1);
    } else {
      // Se não houver mais tentativas, lançar o erro
      throw error;
    }
  }
}



async function PostDados(uri, parametros = {}) {

  const requestURL = url + `/${uri}`;

  try {
    const response = await axios.post(requestURL, parametros, {
      headers: {
        'X-CSRFToken': csrfToken,
        'X-Requested-With': 'XMLHttpRequest',
        'Content-Type': 'application/json',
      }
    });
    return response;
  } catch (error) {
    return error.response
    /* throw error; */ // Rejeitar a promessa para que os chamadores possam lidar com o erro, se necessário
  }
}



function statusAlert(response) {
  if (response.data.status === 'success') {
    return Swal.fire({
      title: "Sucesso",
      text: response.data.message,
      icon: response.data.status
    });
  }
  /* Aqui é quando existe multiplos errors */
  if (response.data.errors) {
    let errorText = '';
    for (const [key, value] of Object.entries(response.data.errors)) {
      errorText += `${value[0]}\n`; // Adiciona a mensagem de erro ao texto
    }

    return Swal.fire({
      title: "Whoops",
      text: errorText,
      icon: 'error'
    });
  }

  if (response.status === 403) {
    return Swal.fire({
      title: "Whoops",
      text: response.data.message,
      icon: 'error'
    });
  }

  return Swal.fire({
    title: "Whoops",
    text: response.data.message,
    icon: response.data.status
  });

}


function loading() {
  Swal.fire({
    title: "Processando",
    html: "Aguardando...",
    timerProgressBar: true,
    didOpen: () => {
      Swal.showLoading();
    },
  });
}

