<?php

namespace App\Http\Livewire\Admin\Noilmiy;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Noilmiy extends Component
{
    public function render()
    {
        $idiume = DB::table('v_ilmiydaraja_ilmiyunvon_me')->get();
        return view('livewire.admin.noilmiy.noilmiy',compact('idiume',$idiume))->extends('layouts.adminApp');
    }
}
