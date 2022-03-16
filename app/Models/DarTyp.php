<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DarTyp extends Model
{
    use HasFactory;
    protected $table = 'tipuroks';
    protected $fillable = ['type','ball'];

    public function dars()
    {
        return $this->belongsTo(Dar::class);
    }
}
