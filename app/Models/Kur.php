<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kur extends Model
{
    use HasFactory;
    protected $table = 'kurs';
    protected $fillable = ['user_id','turi','sana','ball','status','ilova','nomi'];
}
