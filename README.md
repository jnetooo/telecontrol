Este repositório contém a solução completa do teste técnico solicitado, contemplando backend (API e interface web) e aplicativo mobile.

A proposta do projeto foi desenvolver uma API REST para gestão de produtos e ordens de serviço, uma interface web para administração dessas informações e um aplicativo mobile para utilização do técnico em campo.

Estrutura do projeto:
telecontrol/
telecontrol-api/  (Backend em Laravel e Interface Web)
telecontrol-app/  (Aplicativo Mobile em Ionic e Angular)

Backend e Interface Web (Laravel)

Pasta: telecontrol-api

Funcionalidades do backend:
- API REST
- Autenticação via token
- Cadastro e gerenciamento de produtos
- Cadastro e gerenciamento de ordens de serviço
- Atualização de defeito e solução da ordem de serviço
- Interface web para administração utilizando Blade
- Configuração de CORS para consumo da API pelo aplicativo mobile

Tecnologias utilizadas no backend:
- PHP
- Laravel
- SQLite ou MySQL
- Blade
- Sanctum

Execução do backend:
Acesse a pasta telecontrol-api, execute a instalação das dependências com composer, rode as migrations e seeds e inicie o servidor Laravel.

Após iniciar, a aplicação ficará disponível no endereço:
http://127.0.0.1:8000

Aplicativo Mobile (Ionic)

Pasta: telecontrol-app

Funcionalidades do aplicativo:
- Login do técnico
- Listagem de ordens de serviço abertas
- Visualização do detalhe da ordem de serviço
- Preenchimento e salvamento de defeito e solução
- Consumo direto da API desenvolvida no backend

Tecnologias utilizadas no aplicativo:
- Ionic
- Angular
- TypeScript

Execução do aplicativo:
Acesse a pasta telecontrol-app, instale as dependências com npm utilizando a flag legacy-peer-deps e execute o comando ionic serve.

O aplicativo ficará disponível no endereço:
http://localhost:8100

Autenticação

O aplicativo mobile consome a API utilizando autenticação baseada em token.
O login é realizado através do endpoint /api/login.

Observações

O aplicativo mobile foi implementado como um complemento ao escopo principal do teste, demonstrando a integração completa entre frontend mobile e API.

O foco do projeto foi garantir clareza, funcionamento correto, organização do código e estabilidade da solução, mantendo uma interface simples, objetiva e funcional.