<?php

namespace App\Http\Livewire\User\Showall;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Showall extends Component
{
    public $getUserID;
    public function mount($id)
    {
        $this->getUserID = $id;
    }
    public function render()
    {
        $userName = DB::table('v_teachers')
            ->select('id','name','profileimage')
            ->where('id',$this->getUserID)
            ->first();
        $maqolas = DB::table('v_maqolas')
            ->where('user_id','=',$this->getUserID)
            ->where('status','=',1)
            ->get();
        $diss = DB::table('v_dissertats')
            ->where('status','=',1)
            ->where('user_id','=',$this->getUserID)
            ->get();
        $kurs = DB::table('v_kurs')->where('user_id','=',$this->getUserID)
            ->where('status','=',1)
            ->get();
        $langs = DB::table('v_langs')->where('user_id',$this->getUserID)
            ->where('status','=',1)
            ->get();
        $loyihas = DB::table('v_loyihas')
            ->where('user_id','=',$this->getUserID)
            ->where('status','=',1)
            ->get();
        $malakas = DB::table('v_malaks')
            ->where('user_id',$this->getUserID)
            ->where('status','=',1)
            ->get();
        $materials = DB::table('v_materials')
            ->where('user_id','=',$this->getUserID)
            ->where('status','=',1)
            ->get();
        $patents = DB::table('v_patents')
            ->where('user_id','=',$this->getUserID)
            ->where('status','=',1)
            ->get();
        return view('livewire.user.showall.showall',compact('maqolas','diss','userName','kurs','langs','loyihas','malakas','materials','patents'))->extends('layouts.userApp2');
    }
}
