<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ServiceOrder;
use App\Models\Product;
use Illuminate\Support\Carbon;

class OrdemServicoSeeder extends Seeder
{
    public function run(): void
    {
        $produtos = Product::all();
        if ($produtos->isEmpty()) return;

        foreach (range(1, 5) as $i) {
            $p = $produtos->random();

            ServiceOrder::create([
                'numero' => 'OS-' . str_pad((string)$i, 4, '0', STR_PAD_LEFT),
                'data_abertura' => Carbon::now()->subDays(5 - $i),
                'consumidor' => 'Consumidor ' . $i,
                'cpf' => '000.000.000-0' . $i,
                'status' => 'ABERTA',
                'produto_id' => $p->id,
                'defeito' => null,
                'solucao' => null,
            ]);
        }
    }
}
