<?php

namespace App\Models;

use App\Models\Subject;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;


class Dar extends Model
{
    use HasFactory;
    protected $table='dars';
    protected $fillable=['user_id','subject_id','tipurok_id','statusurok_id','mavzu','guruh','sana','ilova','ball','kid'];

    public function subject()
    {
        return $this->belongsTo(\App\Models\Subject::class);
    }
    public function status()
    {
        return $this->belongsTo(DarStat::class);
    }
    public function turi()
    {
        return $this->belongsTo(DarTyp::class);
    }
}
