<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ilmprofile extends Model
{
    use HasFactory;
    protected $table = 'ilmprofiles';
    protected $fillable = ['user_id','iu','iui','status','ball'];
}
