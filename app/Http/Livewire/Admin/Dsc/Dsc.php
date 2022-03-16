<?php

namespace App\Http\Livewire\Admin\Dsc;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Dsc extends Component
{
    public function render()
    {
        $dsc = DB::table('v_dsc')->get();
        return view('livewire.admin.dsc.dsc',compact('dsc',$dsc))->extends('layouts.adminApp');
    }
}
