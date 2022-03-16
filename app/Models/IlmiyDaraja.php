<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IlmiyDaraja extends Model
{
    use HasFactory;
    protected $table = 'ilmiy_darajas';
    protected $fillable = ['user_id','ilmiyDaraja','ilmiyDarajalova','creator','status'];
}
