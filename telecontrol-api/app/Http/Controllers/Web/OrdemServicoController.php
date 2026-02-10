<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ServiceOrder;
use Illuminate\Http\Request;

class OrdemServicoController extends Controller
{
    public function index()
    {
        return view('ordens-servico.index', [
            'ordens' => ServiceOrder::with('produto')->orderByDesc('data_abertura')->get(),
        ]);
    }

    public function create()
    {
        return view('ordens-servico.create', [
            'produtos' => Product::where('ativo', true)->orderBy('nome')->get(),
        ]);
    }

    public function store(Request $request)
    {
        ServiceOrder::create([
            'numero' => $request->numero,
            'data_abertura' => $request->data_abertura,
            'consumidor' => $request->consumidor,
            'cpf' => $request->cpf,
            'status' => $request->status ?? 'ABERTA',
            'produto_id' => $request->produto_id,
            'defeito' => null,
            'solucao' => null,
        ]);

        return redirect('/ordens-servico');
    }
}
