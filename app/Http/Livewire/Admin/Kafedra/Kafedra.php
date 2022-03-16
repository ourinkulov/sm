<?php

namespace App\Http\Livewire\Admin\Kafedra;

use Illuminate\Support\Facades\DB;
use Livewire\Component;
use App\Models\Kafedra as KAF;

class Kafedra extends Component
{
    public $kafName;
    public $kaf_id;
    public function render()
    {
        $kafedras = DB::table('v_kafedra_bosh_light')->get();
        return view('livewire.admin.kafedra.kafedra',compact('kafedras',$kafedras))->extends('layouts.adminApp');
    }
    public function store()
    {
        $valid = $this->validate([
            'kafName'=>'required'
        ]);

        if ($valid)
        {
            if (KAF::create($this->kafName))
            {
                $this->resetVal();
                session()->flash('message','Kafedra saqlandi');
                $this->emit('kafedrasaqlandi');

            }
            else
            {
                $this->resetVal();
                session()->flash('message-dan','Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
                $this->emit('kafedrasaqlandi');
            }
        }
    }
    public function showKafedra($id)
    {
        $this->kaf_id = $id;
        $updateKaf = KAF::find($this->kaf_id);
//        dd($updateKaf->kafName);
        $this->kafName=$updateKaf->kafName;
    }
    public function resetVal()
    {
        $this->kafName = '';
    }

}
