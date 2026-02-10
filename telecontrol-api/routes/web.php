<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Web\ProdutoController;
use App\Http\Controllers\Web\OrdemServicoController;

Route::get('/', fn() => redirect('/login'));

Route::middleware(['auth'])->group(function () {
    Route::resource('produtos', ProdutoController::class)->only(['index','create','store']);
    Route::resource('ordens-servico', OrdemServicoController::class)->only(['index','create','store']);
});

Route::get('/teste-layout', function () {
    return view('teste');
});


require __DIR__.'/auth.php';
