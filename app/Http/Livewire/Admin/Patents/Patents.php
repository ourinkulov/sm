<?php

namespace App\Http\Livewire\Admin\Patents;

use App\Models\Patent;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Patents extends Component
{
    public $user_id;
    public $patent_turi;
    public $miqyosi,$nomi,$raqami,$sana,$muallif,$ilova;
    public $patent_id;


    public function render()
    {
        $this->user_id = Auth::user()->getAuthIdentifier();
        $this->patent_turi = DB::table('patent_turi')->select('id','miqyosi')->get();
        $patents = DB::table('v_patents')->where('status','=',null)->get();

        return view('livewire.admin.patents.patents',compact('patents',$patents))->extends('layouts.adminApp');
    }
    public function showPatent($id)
    {
        $this->patent_id = $id;
        $currentPatent = Patent::find($this->patent_id);
        //dd($currentPatent);
        $this->miqyosi = $currentPatent->miqyosi;
        $this->muallif = $currentPatent->muallif;
    }

    public function store()
    {
        $valid = $this->validate([
            'miqyosi' => 'required',
            'muallif' => 'required',
        ]);
        if ($valid)
        {
            if ($this->miqyosi==1){$ball=15;}
            if ($this->miqyosi==2){$ball=7.5;}
            $updatedPatent = Patent::find($this->patent_id);
            if ($updatedPatent->update([
                'miqyosi'=>$this->miqyosi,
                'muallif'=>$this->muallif,
                'ball'=>$ball/$this->muallif,
                'status'=>'1'
            ]))
            {
                $this->resetVal();
                $this->emit('patenttasdiqandi');
                session()->flash('message', 'Patent tasdiqandi');
            } else {

                $this->emit('patenttasdiqandi');
                session()->flash('message', 'Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
            }
        }
    }
    public function resetVal()
    {
        $this->miqyosi = '';
        $this->nomi = '';
        $this->raqami = '';
        $this->sana = '';
        $this->muallif = '';
        $this->ilova = '';

    }

    public function deleteid($id)
    {
        $this->patent_id = $id;
    }

    public function delete()
    {
        $deletedPatent = Patent::find($this->patent_id);
        if ($deletedPatent->delete())
        {
            $this->resetVal();
            $this->emit('patentuchirildi');
            session()->flash('message-dan', 'Patent o\'chirildi');
        } else {

            $this->emit('patentuchirildi');
            session()->flash('message-dan', 'Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
        }
    }
}
