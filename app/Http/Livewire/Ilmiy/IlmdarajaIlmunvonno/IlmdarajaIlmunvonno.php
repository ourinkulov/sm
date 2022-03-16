<?php

namespace App\Http\Livewire\Ilmiy\IlmdarajaIlmunvonno;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class IlmdarajaIlmunvonno extends Component
{
    public function render()
    {
        $idiume = DB::table('v_ilmiydaraja_ilmiyunvon_me')->get();
        return view('livewire.ilmiy.ilmdaraja-ilmunvonno.ilmdaraja-ilmunvonno',compact('idiume',$idiume))->extends('layouts.ilmiyApp');
    }
}
