# Projeto Solitic 

### Task: 
Registro de Cliente, Exportação Excel e Tabela com dados dos Clientes

### Tech: 
Python/Django - Axios - Jquery - Bootstrap - DataTable - SweetAlerts


### Para Executar/Rodar o Projeto:
   execute os seguintes comandos no terminal:

#### Criar Ambiente Virtual:

python -m venv venv


#### Ativar Ambiente Virtual: Windows


venv\Scripts\activate

#### Ativar Ambiente Virtual: Linux
source venv/bin/activate



#### Instalar dependências
pip install -r requirements.txt


#### Instalar a cópia do banco de dados ou Rodar as migrations
a copia do banco está na pasta DB, basta executar no SGBD, que criará a base de dados,
o sistema está rodando mysql e o nome esperado é 'NAME': 'TaskSolutic',
para alterar as configurações, ir no settings.py e procurar DATABASES.


##### Rodar as Migrations:
python manage.py migrate



#### Executar o Servidor
python manage.py runserver

