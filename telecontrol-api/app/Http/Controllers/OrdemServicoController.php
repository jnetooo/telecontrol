<?php

namespace App\Http\Controllers;

use App\Models\ServiceOrder;
use Illuminate\Http\Request;

class OrdemServicoController extends Controller
{
    public function index(Request $request)
    {
        $status = $request->query('status', 'ABERTA');

        return ServiceOrder::with('produto')
            ->where('status', $status)
            ->orderByDesc('data_abertura')
            ->get();
    }

    public function show($id)
    {
        return ServiceOrder::with('produto')->findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $dados = $request->validate([
            'defeito' => ['nullable', 'string'],
            'solucao' => ['nullable', 'string'],
        ]);

        $ordem = ServiceOrder::findOrFail($id);
        $ordem->fill($dados)->save();

        return $ordem->load('produto');
    }
}
