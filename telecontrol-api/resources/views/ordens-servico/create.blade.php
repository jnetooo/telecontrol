@extends('layout')

@section('content')
<h1 class="h4 mb-3">Nova Ordem de Serviço</h1>

<form method="POST" action="/ordens-servico">
  @csrf

  <div class="mb-3">
    <label class="form-label">Número da Ordem</label>
    <input
      type="text"
      name="numero"
      class="form-control"
      placeholder="Ex: OS-0001"
      required
    >
  </div>

  <div class="mb-3">
    <label class="form-label">Data de Abertura</label>
    <input
      type="datetime-local"
      name="data_abertura"
      class="form-control"
      required
    >
  </div>

  <div class="mb-3">
    <label class="form-label">Nome do Consumidor</label>
    <input
      type="text"
      name="consumidor"
      class="form-control"
      required
    >
  </div>

  <div class="mb-3">
    <label class="form-label">CPF do Consumidor</label>
    <input
      type="text"
      name="cpf"
      class="form-control"
      placeholder="000.000.000-00"
      required
    >
  </div>

  <div class="mb-3">
    <label class="form-label">Status</label>
    <select name="status" class="form-select">
      <option value="ABERTA" selected>ABERTA</option>
      <option value="FECHADA">FECHADA</option>
    </select>
  </div>

  <div class="mb-4">
    <label class="form-label">Produto</label>
    <select name="produto_id" class="form-select" required>
      <option value="">Selecione um produto</option>
      @foreach ($produtos as $p)
        <option value="{{ $p->id }}">
          {{ $p->nome }} ({{ $p->codigo }})
        </option>
      @endforeach
    </select>
  </div>

  <div class="d-flex gap-2">
    <button type="submit" class="btn btn-success">
      Salvar Ordem
    </button>
    <a href="/ordens-servico" class="btn btn-secondary">
      Cancelar
    </a>
  </div>
</form>
@endsection
