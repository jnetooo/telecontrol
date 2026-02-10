@extends('layout')

@section('content')
<h1 class="h4 mb-3">Produtos</h1>

<a href="/produtos/create" class="btn btn-primary mb-3">Novo Produto</a>

<table class="table table-bordered">
  <thead>
    <tr>
      <th>Código</th>
      <th>Nome</th>
      <th>Garantia (meses)</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    @foreach ($produtos as $p)
      <tr>
        <td>{{ $p->codigo }}</td>
        <td>{{ $p->nome }}</td>
        <td>{{ $p->garantia_meses }}</td>
        <td>{{ $p->ativo ? 'Ativo' : 'Inativo' }}</td>
      </tr>
    @endforeach
  </tbody>
</table>
@endsection
