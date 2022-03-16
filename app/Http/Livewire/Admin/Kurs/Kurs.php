<?php

namespace App\Http\Livewire\Admin\Kurs;

use App\Models\Kur;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithFileUploads;

class Kurs extends Component
{
    use WithFileUploads;
    public $turi,$sana,$ilova,$nomi;
    public $user_id,$updatedKurs_id, $deletedKurs_id;
    public function render()
    {
        $this->user_id = Auth::user()->getAuthIdentifier();
//        $study_year = DB::table('study_year')->select('id','year')->get();
        $kurs_turi = DB::table('kurs_turi')->select('id','turi')->get();
        $kurs = DB::table('v_kurs')
            ->where('status','=',null)
            ->get();

        return view('livewire.admin.kurs.kurs',compact(['kurs',$kurs,'kurs_turi',$kurs_turi]))->extends('layouts.adminApp');
    }
    public function resetVal()
    {
        $this->turi = '';
        $this->sana = '';
        $this->nomi = '';
        $this->ilova = '';
    }
    public function showKurs($id)
    {
        $this->updatedKurs_id = $id;
        $updatedKurs = Kur::find($this->updatedKurs_id);
        $this->turi = $updatedKurs->turi;
    }

    public function update()
    {
        $valid = $this->validate([
            'turi'=>'required',
        ]);
        if ($valid)
        {
            $savedKurs = Kur::find($this->updatedKurs_id);
            if ($this->turi == 1){$ball = 1.2;}
            if ($this->turi == 2){$ball = 3;}
            if ($this->turi == 3){$ball = 2.25;}
            if ($this->turi == 4){$ball = 1.5;}
            if ($savedKurs->update([
                'turi'=>$this->turi,
                'ball'=>$ball,
                'status'=>1,
            ]))
            {
                $this->resetVal();
                $this->emit('kurstasdiqlandi');
                session()->flash('message','Ma\'lumot tasdiqlandi');
            }
            else
            {
                $this->resetVal();
                $this->emit('kurstasdiqlandi');
                session()->flash('message-dan','Xatolik yuz berdi. Qaytadan urinib ko\'ring');
            }
        }
    }
    public function deleteid($id)
    {
        $this->deletedKurs_id = $id;
    }
    public function delete()
    {
        $deletedKurs = Kur::find($this->deletedKurs_id);
        if ($deletedKurs->delete())
        {
            $this->resetVal();
            $this->emit('kursdeleted');
            session()->flash('message-dan','Ma\'lumot o\'chirildi');
        }
        else
        {
            $this->resetVal();
            $this->emit('kursdeleted');
            session()->flash('message-dan','Xatolik yuz berdi. Qaytadan urinib ko\'ring');
        }
    }
}
