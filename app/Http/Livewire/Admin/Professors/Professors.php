<?php

namespace App\Http\Livewire\Admin\Professors;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Professors extends Component
{
    public function render()
    {
        $professors = DB::table('v_professors')->get();
        return view('livewire.admin.professors.professors',compact('professors',$professors))->extends('layouts.adminApp');
    }
}
