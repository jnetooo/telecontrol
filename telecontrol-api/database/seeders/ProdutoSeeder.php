<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;

class ProdutoSeeder extends Seeder
{
    public function run(): void
    {
        Product::insert([
            ['codigo' => 'P001', 'nome' => 'Produto A', 'garantia_meses' => 12, 'ativo' => true],
            ['codigo' => 'P002', 'nome' => 'Produto B', 'garantia_meses' => 6,  'ativo' => true],
            ['codigo' => 'P003', 'nome' => 'Produto C', 'garantia_meses' => 0,  'ativo' => true],
        ]);
    }
}
