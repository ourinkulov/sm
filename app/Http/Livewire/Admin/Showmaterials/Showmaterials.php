<?php

namespace App\Http\Livewire\Admin\Showmaterials;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Showmaterials extends Component
{
    public $materials;
    public $kafedras;
    public $kaf_id;
    public function render()
    {
        if ($this->kaf_id != '')
        {
            //dd($this->kaf_id);
            $this->materials = DB::table('v_materials')
                ->where('kafid','=',$this->kaf_id)
                ->get();
        }

        $this->kafedras = DB::table('v_kafedra_bosh_light')->get();
        return view('livewire.admin.showmaterials.showmaterials')->extends('layouts.adminApp');
    }
}
