<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Loyiha extends Model
{
    use HasFactory;
    protected $table = 'loyihas';
   protected $fillable = ['user_id','miqyosi','mavzu','raqami','bsana','ysana','ball','status','buyruq','ilova'];
}
