A proposta do projeto foi desenvolver uma API REST para gestão de produtos e ordens de serviço, uma interface web para administração dessas informações e aplicativos mobile para utilização do técnico em campo, implementados em Ionic e Flutter, ambos consumindo a mesma API.

⸻

Estrutura do projeto

telecontrol/
telecontrol-api/  (Backend em Laravel e Interface Web)
telecontrol-app/  (Aplicativo Mobile em Ionic + Angular)
telecontrol-flutter/  (Aplicativo Mobile em Flutter)

⸻

Backend e Interface Web (Laravel)

Pasta: telecontrol-api

Funcionalidades do backend
	•	API REST
	•	Autenticação via token
	•	Cadastro e gerenciamento de produtos
	•	Cadastro e gerenciamento de ordens de serviço
	•	Atualização de defeito e solução da ordem de serviço
	•	Interface web para administração utilizando Blade
	•	Configuração de CORS para consumo da API pelos aplicativos mobile

Tecnologias utilizadas no backend
	•	PHP
	•	Laravel
	•	SQLite ou MySQL
	•	Blade
	•	Sanctum

Execução do backend

Acesse a pasta telecontrol-api, execute a instalação das dependências com composer, rode as migrations e seeds e inicie o servidor Laravel.

Após iniciar, a aplicação ficará disponível em:
http://127.0.0.1:8000

⸻

Aplicativo Mobile – Ionic

Pasta: telecontrol-app

Funcionalidades do aplicativo
	•	Login do técnico
	•	Listagem de ordens de serviço abertas
	•	Visualização do detalhe da ordem de serviço
	•	Preenchimento e salvamento de defeito e solução
	•	Consumo direto da API desenvolvida no backend

Tecnologias utilizadas
	•	Ionic
	•	Angular
	•	TypeScript

Execução do aplicativo

Acesse a pasta telecontrol-app, instale as dependências com npm utilizando a flag --legacy-peer-deps e execute o comando ionic serve.

O aplicativo ficará disponível em:
http://localhost:8100

⸻

Aplicativo Mobile – Flutter

Pasta: telecontrol-flutter

Funcionalidades do aplicativo
	•	Login do técnico
	•	Listagem de ordens de serviço abertas
	•	Visualização do detalhe da ordem de serviço
	•	Preenchimento e salvamento de defeito e solução
	•	Consumo da mesma API REST utilizada pelo aplicativo Ionic

O aplicativo Flutter possui o mesmo fluxo funcional do aplicativo Ionic, demonstrando consistência na integração com o backend independentemente da tecnologia mobile utilizada.

Tecnologias utilizadas
	•	Flutter
	•	Dart

Execução do aplicativo

Acesse a pasta telecontrol-flutter e execute o projeto utilizando Flutter (por exemplo, via navegador ou emulador configurado).

⸻

Autenticação

Os aplicativos mobile consomem a API utilizando autenticação baseada em token.
O login é realizado através do endpoint:
/api/login

⸻

Observações

Os aplicativos mobile (Ionic e Flutter) foram implementados como complemento ao escopo principal do teste, demonstrando a integração completa entre API e múltiplas tecnologias frontend mobile.

O foco do projeto foi garantir clareza, funcionamento correto, organização do código e estabilidade da solução, mantendo interfaces simples, objetivas e funcionais.
