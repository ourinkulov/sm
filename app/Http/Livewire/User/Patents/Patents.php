<?php

namespace App\Http\Livewire\User\Patents;

use App\Models\Patent;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithFileUploads;

class Patents extends Component
{
    use WithFileUploads;
    public $user_id;
    public $patent_turi;
    public $miqyosi,$nomi,$raqami,$sana,$muallif,$ilova;
    public $patent_id;
    public function render()
    {
        $this->user_id = Auth::user()->getAuthIdentifier();
        $this->patent_turi = DB::table('patent_turi')->select('id','miqyosi')->get();
        $patents = DB::table('v_patents')->where('user_id','=',$this->user_id)->where('status','=',1)->get();
        return view('livewire.user.patents.patents',compact(['patents',$patents]))->extends('layouts.userApp2');
    }
    public function store()
    {
        $valid = $this->validate([
            'miqyosi' => 'required',
            'nomi' => 'required',
            'raqami' => 'required',
            'sana' => 'required',
            'muallif' => 'required',
            'ilova' => 'required',

        ]);
        if ($valid) {
            $fileName = time() . '_' . $this->ilova->getClientOriginalName();
            $filePath = $this->ilova->storeAs('patentlar', $fileName, 'public');
            if ($storedPatent = Patent::create([
                'miqyosi' => $this->miqyosi,
                'nomi' => $this->nomi,
                'raqami' => $this->raqami,
                'sana' => $this->sana,
                'muallif' => $this->muallif,
                'ilova' => $fileName,
                'user_id'=>$this->user_id
            ])) {
                $this->resetVal();
                $this->emit('patentkiritildi');
                session()->flash('message', 'Sizning patentingiz tizimga kiritildi. Tasdiqlash jarayonidan so\'ng Sizga ball ajratiladi. Rahmat');
            } else {

                $this->emit('patentkiritildi');
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
}
