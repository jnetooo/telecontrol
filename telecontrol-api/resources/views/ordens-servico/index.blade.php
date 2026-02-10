@extends('layout')

@section('content')
<h1 class="h4 mb-3">Ordens de Serviço</h1>

<a href="/ordens-servico/create" class="btn btn-primary mb-3">Nova Ordem</a>

<table class="table table-bordered">
  <thead>
    <tr>
      <th>Número</th>
      <th>Data Abertura</th>
      <th>Consumidor</th>
      <th>CPF</th>
      <th>Status</th>
      <th>Produto</th>
    </tr>
  </thead>
  <tbody>
    @foreach ($ordens as $o)
      <tr>
        <td>{{ $o->numero }}</td>
        <td>{{ $o->data_abertura }}</td>
        <td>{{ $o->consumidor }}</td>
        <td>{{ $o->cpf }}</td>
        <td>{{ $o->status }}</td>
        <td>{{ $o->produto?->nome }} ({{ $o->produto?->codigo }})</td>
      </tr>
    @endforeach
  </tbody>
</table>
@endsection
