<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DarStat extends Model
{
    use HasFactory;
    protected $table = 'statusuroks';
    protected $fillable = ['status '];

    public function dars()
    {
        return $this->hasMany(Dar::class);
    }
}
