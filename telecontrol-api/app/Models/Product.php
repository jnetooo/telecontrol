<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Product extends Model
{
    use HasFactory;

    protected $table = 'produtos';

    protected $fillable = [
        'codigo',
        'nome',
        'garantia_meses',
        'ativo',
    ];

    protected $casts = [
        'ativo' => 'boolean',
        'garantia_meses' => 'integer',
    ];

    public function ordensServico()
    {
        return $this->hasMany(ServiceOrder::class, 'produto_id');
    }
}
