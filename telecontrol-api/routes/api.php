<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\OrdemServicoController;

Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/ordens-servico', [OrdemServicoController::class, 'index']);
    Route::get('/ordens-servico/{id}', [OrdemServicoController::class, 'show']);
    Route::put('/ordens-servico/{id}', [OrdemServicoController::class, 'update']);
});
