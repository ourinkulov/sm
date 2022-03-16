<?php

namespace App\Http\Livewire\Admin\Showmaqolas;

use http\Env\Request;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Showmaqolas extends Component
{
    public $kaf_id;

    public function render()
    {

        $maqolas = NULL;

        if ($this->kaf_id != '')
        {
            $maqolas = DB::table('v_maqolas')->select('id','name','turi','miqyosi','mavzu','mualliflik','ilova','ball')
                ->where('kafid',$this->kaf_id)
                ->get();
        }

        $kafedras = DB::table('v_kafedra_bosh_light')->get();
//        dd($kafedras);

        return view('livewire.admin.showmaqolas.showmaqolas',compact(['kafedras',$kafedras,'maqolas',$maqolas]))->extends('layouts.adminApp');
    }
}
