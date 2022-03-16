<?php

namespace App\Http\Livewire\Admin\Showmalakas;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Showmalakas extends Component
{
    public $malakas,$kafedras,$kaf_id;
    public function render()
    {
        if ($this->kaf_id != '')
        {
            $this->malakas = DB::table('v_malaks')
                ->where('kafid','=',$this->kaf_id)
                ->get();
        }

        $this->kafedras = DB::table('v_kafedra_bosh_light')->get();
        return view('livewire.admin.showmalakas.showmalakas')->extends('layouts.adminApp');
    }
}
