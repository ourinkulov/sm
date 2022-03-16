<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lang extends Model
{
    use HasFactory;
    protected $table = 'langs';
    protected $fillable = ['user_id','langname_id','langtype_id','ball','status','bsana','ysana','ilova'];
}
