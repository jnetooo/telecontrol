<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ordem_servicos', function (Blueprint $table) {
            $table->id();
            $table->string('numero', 30)->unique();
            $table->dateTime('data_abertura');
            $table->string('consumidor', 120);
            $table->string('cpf', 14);
            $table->string('status', 20)->default('ABERTA');
            $table->foreignId('produto_id')
                ->constrained('produtos')
                ->restrictOnDelete()
                ->cascadeOnUpdate();
            $table->text('defeito')->nullable();
            $table->text('solucao')->nullable();
            $table->timestamps();
            $table->index('status');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ordem_servicos');
    }
};
