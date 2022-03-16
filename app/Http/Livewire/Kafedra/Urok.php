<?php

namespace App\Http\Livewire\Kafedra;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Urok extends Component
{
    public $kafid;
    public function render()
    {
        $this->kafid = Auth::user()->kafid;
        $dars = DB::table('v_dars')
            ->select('id','name','kafName','fannomi','type','mavzu','guruh','sana','ilova','ball','status')
            ->where('statusurok_id','=',2)
            ->where('kid','=',$this->kafid)
            ->get();
        return view('livewire.kafedra.urok',compact('dars',$dars))->extends('layouts.kafedraApp');
    }
}
