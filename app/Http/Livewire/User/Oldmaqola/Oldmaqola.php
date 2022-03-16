<?php

namespace App\Http\Livewire\User\Oldmaqola;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Oldmaqola extends Component
{
    public $user_id;
    public function render()
    {
        $this->user_id = Auth::user()->getAuthIdentifier();
        $maqolas = DB::table('v_old_maqolas')
            ->where('id',$this->user_id)->get();
        return view('livewire.user.oldmaqola.oldmaqola',compact('maqolas'))->extends('layouts.userApp2');
    }
}
