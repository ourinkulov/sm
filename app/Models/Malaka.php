<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Malaka extends Model
{
    use HasFactory;
    protected $table = 'malakas';
    protected $fillable = ['user_id','turi','sana','kun','mavzu','ilova','ball','status'];
}
