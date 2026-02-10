<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class ProdutoController extends Controller
{
    public function index()
    {
        return view('produtos.index', [
            'produtos' => Product::all()
        ]);
    }

    public function create()
    {
        return view('produtos.create');
    }

    public function store(Request $request)
    {
        Product::create([
            'codigo' => $request->codigo,
            'nome' => $request->nome,
            'garantia_meses' => $request->garantia_meses,
            'ativo' => $request->has('ativo'),
        ]);

        return redirect('/produtos');
    }
}
