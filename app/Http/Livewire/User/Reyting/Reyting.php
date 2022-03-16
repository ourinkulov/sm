<?php

namespace App\Http\Livewire\User\Reyting;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Reyting extends Component
{
    public $userID;
    public function render()
    {
        $this->userID = Auth::user()->getAuthIdentifier();
        $teach_reyting  = DB::table('v_teachers_reyting_with_kaf_name')->get();
        $kafedra_reyting = DB::table('v_kafedra_reyting')->get();
        return view('livewire.user.reyting.reyting',compact('kafedra_reyting','teach_reyting'))->extends('layouts.userApp2');
    }
}
