<?php

namespace App\Http\Livewire\Admin\Phd;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Phd extends Component
{
    public function render()
    {
        $phd = DB::table('v_phd')->get();
        return view('livewire.admin.phd.phd',compact('phd',$phd))->extends('layouts.adminApp');
    }
}
