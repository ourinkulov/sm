<?php

namespace App\Http\Livewire\Ilmiy\Professors;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Professors extends Component
{
    public function render()
    {
        $professors = DB::table('v_professors')->get();
        return view('livewire.ilmiy.professors.professors',compact('professors',$professors))->extends('layouts.ilmiyApp');
    }
}
