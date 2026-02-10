<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ServiceOrder extends Model
{
    use HasFactory;

    protected $table = 'ordem_servicos';

    protected $fillable = [
        'numero',
        'data_abertura',
        'consumidor',
        'cpf',
        'status',
        'produto_id',
        'defeito',
        'solucao',
    ];

    protected $casts = [
        'data_abertura' => 'datetime',
    ];

    public function produto()
    {
        return $this->belongsTo(Product::class, 'produto_id');
    }
}
