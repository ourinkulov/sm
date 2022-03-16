<?php

namespace App\Http\Livewire\Ilmiy\Dotsent;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Dotsent extends Component
{
    public function render()
    {
        $dotsents = DB::table('v_dotsents')->get();
        return view('livewire.ilmiy.dotsent.dotsent',compact('dotsents',$dotsents))->extends('layouts.ilmiyApp');
    }
}
