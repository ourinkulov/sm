<?php

namespace App\Http\Livewire\Admin\Showdars;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Showdars extends Component
{
    public $dars;
    public $kafedras,$kaf_id;
    public function render()
    {
        if ($this->kaf_id != '')
        {
            //dd($this->kaf_id);
            $this->dars = DB::table('v_dars')
                ->where('kid','=',$this->kaf_id)
                ->get();
        }

        $this->kafedras = DB::table('v_kafedra_bosh_light')->get();
        return view('livewire.admin.showdars.showdars')->extends('layouts.adminApp');
    }
}
