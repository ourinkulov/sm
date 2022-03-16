<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dissertat extends Model
{
    use HasFactory;
    protected $table = 'dissertats';
    protected $fillable = ['mavzu','maqomi','shifr','nomi','fan','tsana','ysana','dalolatnoma','user_id','maqomi','ball','status'];
}
