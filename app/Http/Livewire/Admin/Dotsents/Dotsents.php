<?php

namespace App\Http\Livewire\Admin\Dotsents;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Dotsents extends Component
{
    public function render()
    {
        $dotsents = DB::table('v_dotsents')->get();
        return view('livewire.admin.dotsents.dotsents',compact('dotsents',$dotsents))->extends('layouts.adminApp');
    }
}
