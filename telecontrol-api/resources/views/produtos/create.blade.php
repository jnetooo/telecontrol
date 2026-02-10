@extends('layout')

@section('content')
<h1 class="h4 mb-3">Novo Produto</h1>

<form method="POST" action="/produtos">
  @csrf

  <div class="mb-2">
    <label>Código</label>
    <input name="codigo" class="form-control" required>
  </div>

  <div class="mb-2">
    <label>Nome</label>
    <input name="nome" class="form-control" required>
  </div>

  <div class="mb-2">
    <label>Garantia (meses)</label>
    <input name="garantia_meses" type="number" class="form-control" value="0">
  </div>

  <div class="form-check mb-3">
    <input class="form-check-input" type="checkbox" name="ativo" checked>
    <label class="form-check-label">Ativo</label>
  </div>

  <button class="btn btn-success">Salvar</button>
</form>
@endsection
