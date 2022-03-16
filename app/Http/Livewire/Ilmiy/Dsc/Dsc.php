<?php

namespace App\Http\Livewire\Ilmiy\Dsc;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Dsc extends Component
{
    public function render()
    {
        $dsc = DB::table('v_dsc')->get();
        return view('livewire.ilmiy.dsc.dsc',compact('dsc',$dsc))->extends('layouts.ilmiyApp');
    }
}
