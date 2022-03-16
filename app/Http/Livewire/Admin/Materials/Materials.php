<?php

namespace App\Http\Livewire\Admin\Materials;

use App\Models\Material;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Materials extends Component
{
    public $turi, $nomi,$muallif,$taboq,$sana,$ilova;
    public $user_id;
    public $material_id;
    public function render()
    {
        $material_turi = DB::table('material_turi')->select('id','turi')->get();
        $this->user_id = Auth::user()->getAuthIdentifier();
        $materials = DB::table('v_materials')->where('status','=',null)->get();
        return view('livewire.admin.materials.materials',compact(['materials',$materials],['material_turi',$material_turi]))->extends('layouts.adminApp');
    }
    public function showMaterial($id)
    {
        $this->material_id = $id;
        $currentMaterial = Material::find($this->material_id);
        $this->turi = $currentMaterial->turi;
        $this->taboq = $currentMaterial->taboq;
        $this->muallif = $currentMaterial->muallif;
    }


    public function update()
    {
        $valid = $this->validate([
            'turi'=>'required',
            'taboq'=>'required',
            'muallif'=>'required',
        ]);
        if ($valid)
        {
            $updatedMaterial = Material::find($this->material_id);
            if ($this->turi==1){$ball = 2.5;}
            if ($this->turi==2){$ball = 1.5;}
            if ($this->turi==3){$ball = 1.5;}
            if ($this->turi==4){$ball = 2.5;}
            $sumBall = ($ball*$this->taboq)/$this->muallif;
            if ($updatedMaterial->update([
                'turi'=>$this->turi,
                'taboq'=>$this->taboq,
                'muallif'=>$this->muallif,
                'ball'=>$sumBall,
                'status'=>'1'
            ]))
            {
                $this->resetVal();
                $this->emit('materialtasdiqlandi');
                session()->flash('message','Material tasdiqlandi');
            }
            else
            {
                $this->emit('materialtasdiqlandi');
                session()->flash('message','Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
            }
        }
    }

    public function deleteid($id)
    {
        $this->material_id = $id;
    }

    public function delete()
    {
        $deletedMaterial = Material::find($this->material_id);
        if ($deletedMaterial->delete())
        {
            $this->resetVal();
            $this->emit('materialuchirildi');
            session()->flash('message-dan','Material o\'chirildi');
        }
        else
        {
            $this->emit('materialuchirildi');
            session()->flash('message-dan','Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
        }
    }

    public function resetVal()
    {
        $this->turi='';
        $this->nomi='';
        $this->muallif='';
        $this->taboq='';
        $this->sana='';
        $this->ilova='';
    }
}
