<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Maqola extends Model
{
    use HasFactory;
    protected $table = 'maqolas';
    protected $fillable = ['turi','mavzu','mualliflik','miqyosi','ilova','user_id','status','ball'];
}
