<?php

namespace App\Http\Livewire\User\Malakas;

use App\Models\Malaka;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithFileUploads;

class Malakas extends Component
{
    use WithFileUploads;
    public $turi,$mavzu,$user_id,$kun,$sana,$ilova;

    public function render()
    {
        $this->user_id = Auth::user()->getAuthIdentifier();
        $study_year = DB::table('study_year')->select('id','year')->get();
        $malaka_turi = DB::table('malaka_turi')
            ->select('id','turi')->get();
        $malakas = DB::table('v_malaks')
            ->where('user_id',$this->user_id)
            ->where('status','=',1)
            ->get();
        return view('livewire.user.malakas.malakas',compact(['malaka_turi',$malaka_turi,'study_year',$study_year,'malakas',$malakas]))->extends('layouts.userApp2');
    }

    public function resetVal()
    {
        $this->turi = '';
        $this->mavzu = '';
        $this->sana = '';
        $this->kun = '';
        $this->ilova = '';

    }

    public function store()
    {
        $valid = $this->validate([
            'turi'=>'required',
            'mavzu'=>'required',
            'sana'=>'required',
            'kun'=>'required',
            'ilova'=>'required',

        ]);
        if ($valid)
        {
            $fileName = $this->ilova->getClientOriginalName();
            $filePath = $this->ilova->storeAs('malaka',$fileName,'public');
            if (Malaka::create([
                'turi'=>$this->turi,
                'mavzu'=>$this->mavzu,
                'sana'=>$this->sana,
                'kun'=>$this->kun,
                'ilova'=>$fileName,
                'user_id'=>$this->user_id

            ]))
            {
                $this->resetVal();
                $this->emit('malakakiritildi');
                session()->flash('message','Malak oshirish ma\'lumotlari tizimga kiritildi. tasdiqlash jaraynidan keyin Sizga ball ajratiladi. Rahmat!');
            }
            else
            {
                $this->resetVal();
                $this->emit('malakakiritildi');
                session()->flash('message-dan','Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
            }
        }
    }
}
