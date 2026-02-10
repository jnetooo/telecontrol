<!doctype html>
<html lang="pt-br">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <title>Telecontrol</title>
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="/produtos">Telecontrol</a>
    <div class="d-flex gap-2">
      <a class="btn btn-sm btn-outline-light" href="/produtos">Produtos</a>
      <a class="btn btn-sm btn-outline-light" href="/ordens-servico">Ordens</a>
      <form method="POST" action="/logout" class="m-0">
        @csrf
        <button class="btn btn-sm btn-danger">Sair</button>
      </form>
    </div>
  </div>
</nav>

<main class="container py-4">
  @yield('content')
</main>
</body>
</html>
