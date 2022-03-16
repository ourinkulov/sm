<?php

namespace App\Http\Livewire\Admin\Showpatents;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Showpatents extends Component
{
    public $kaf_id;
    public $patents;
    public $kafedras;
    public function render()
    {

//        $patents = NULL;


        if ($this->kaf_id != '')
        {
            //dd($this->kaf_id);
            $this->patents = DB::table('v_patents')
                ->where('kafid','=',$this->kaf_id)
                ->get();
        }

        $this->kafedras = DB::table('v_kafedra_bosh_light')->get();
//        dd($kafedras);

        return view('livewire.admin.showpatents.showpatents')->extends('layouts.adminApp');
    }
}
