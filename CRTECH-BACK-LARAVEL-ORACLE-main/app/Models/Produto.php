<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produto extends Model
{
    use HasFactory;

    //Sao os campos da tabela que não podem ser armazanados diretamente no construtor model
    protected $fillable = [
        'nome',
        'preco',
        'descricao',
        'imagem',
        'categoria',
        'quantidade'
    ];

}
