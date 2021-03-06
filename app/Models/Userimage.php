<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Userimage extends Model
{
    use HasFactory;
    protected $table = 'userimages';
    protected $fillable = ['user_id','profileimage'];
}
