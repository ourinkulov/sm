<?php

namespace App\Http\Livewire\User\Materials;

use App\Models\Material;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithFileUploads;

class Materials extends Component
{
    use WithFileUploads;
    public $turi, $nomi,$muallif,$taboq,$sana,$ilova;
    public $user_id;

    public function render()
    {
        $material_turi = DB::table('material_turi')->select('id','turi')->get();
        $this->user_id = Auth::user()->getAuthIdentifier();
        $materials = DB::table('v_materials')->where('user_id','=',$this->user_id)->where('status','=',1)->get();
        return view('livewire.user.materials.materials',compact(['material_turi',$material_turi],['materials',$materials]))->extends('layouts.userApp2');
    }
    public function store()
    {
        $valid = $this->validate(
            [
                'turi'=>'required|numeric',
                'nomi'=>'required',
                'muallif'=>'required',
                'taboq'=>'required',
                'sana'=>'required',
                'ilova'=>'required',

            ]
        );
        if ($valid)
        {
            $fileName = time().'_'.$this->ilova->getClientOriginalName();
            $filePath = $this->ilova->storeAs('material', $fileName, 'public');
            $createdMaterial = Material::create(
                [
                    'turi'=>$this->turi,
                    'nomi'=>$this->nomi,
                    'muallif'=>$this->muallif,
                    'taboq'=>$this->taboq,
                    'sana'=>$this->sana,
                    'ilova'=>$fileName,
                    'user_id'=>$this->user_id
                ]
            );
            if ($createdMaterial)
            {
                $this->resetVal();
                $this->emit('materialsaqlandi');
                session()->flash('message','Sizning materialingiz tizimga kiritildi. Tasdiqlash jarayonidan so\'ng Sizga ball ajratiladi. Rahmat');
            }
            else
            {

                $this->emit('materialsaqlandi');
                session()->flash('message','Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
            }
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
