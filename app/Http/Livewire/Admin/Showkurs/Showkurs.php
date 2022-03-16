<?php

namespace App\Http\Livewire\Admin\Showkurs;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Showkurs extends Component
{
    public $kurs;
    public $kafedras,$kaf_id;
    public function render()
    {
        if ($this->kaf_id != '')
        {
            $this->kurs = DB::table('v_kurs')
                ->where('kafid','=',$this->kaf_id)
                ->get();
        }

        $this->kafedras = DB::table('v_kafedra_bosh_light')->get();
        return view('livewire.admin.showkurs.showkurs')->extends('layouts.adminApp');
    }
}
