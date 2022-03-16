<?php

namespace App\Http\Livewire\Admin\Reytings;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Reytings extends Component
{
    public function render()
    {
        $teach_reyting  = DB::table('v_teachers_reyting_with_kaf_name')->get();
        $kafedra_reyting = DB::table('v_kafedra_reyting')->get();
        return view('livewire.admin.reytings.reytings',compact('kafedra_reyting','teach_reyting'))->extends('layouts.adminApp');
    }
}
