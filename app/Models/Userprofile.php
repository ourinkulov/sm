<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Userprofile extends Model
{
    use HasFactory;
    protected $table = 'userprofiles';
    protected $fillable = ['user_id','born','malumot','mutaxassislik','iioq','ait','pit'];
}
