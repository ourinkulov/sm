<?php

namespace App\Http\Livewire\User\Kurs;

use App\Models\Kur;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithFileUploads;

class Kurs extends Component
{
    use WithFileUploads;
    public $turi,$sana,$ilova,$nomi;
    public $user_id;
    public function render()
    {
        $this->user_id = Auth::user()->getAuthIdentifier();
        $study_year = DB::table('study_year')->select('id','year')->get();
        $kurs_turi = DB::table('kurs_turi')->select('id','turi')->get();
        $kurs = DB::table('v_kurs')->where('user_id','=',$this->user_id)
            ->where('status','=',1)
            ->get();

        return view('livewire.user.kurs.kurs',compact(['kurs',$kurs,'study_year',$study_year,'kurs_turi',$kurs_turi]))->extends('layouts.userApp2');
    }
    public function resetVal()
    {
        $this->turi = '';
        $this->sana = '';
        $this->nomi = '';
        $this->ilova = '';


    }

    public function store()
    {
        $valid = $this->validate([
            'turi'=>'required',
            'nomi'=>'required',
            'sana'=>'required',
            'ilova'=>'required',
        ]);
        if ($valid)
        {
            $fileName = $this->ilova->getClientOriginalName();
            $filePath = time().'_'.$this->ilova->storeAs('kurs',$fileName,'public');
            if ($storedKurs = Kur::create([
                'turi'=>$this->turi,
                'nomi'=>$this->nomi,
                'sana'=>$this->sana,
                'ilova'=>$fileName,
                'user_id'=>$this->user_id
            ]))
            {
                $this->resetVal();
                $this->emit('kurskiritildi');
                session()->flash('message','Ma\lumot tizimga kiritildi. Tasdiqlash jarayonidan so\'ng Sizga ball ajratiladi.Rahmat');
            }
            else
            {
                $this->resetVal();
                $this->emit('kurskiritildi');
                session()->flash('message-dan','Xatolik yuz berdi. Qaytadan urinib ko\'ring');
            }
        }
    }
}
