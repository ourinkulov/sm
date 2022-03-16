<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Dar;

class Subject extends Model
{
    use HasFactory;
    protected $table = 'subjects';
    protected $fillable = ['kafedras_id ','fannomi'];

    public function dars()
    {
        return $this->belongsTo(\App\Models\Dar::class);
    }
}
