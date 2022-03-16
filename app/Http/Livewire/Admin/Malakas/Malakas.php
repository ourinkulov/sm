<?php

namespace App\Http\Livewire\Admin\Malakas;

use App\Models\Malaka;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Malakas extends Component
{
    public $turi,$mavzu,$user_id,$kun,$sana,$ilova;
    public $updatedMalaka_id,$deletedMalaka_id;

    public function render()
    {
        $this->user_id = Auth::user()->getAuthIdentifier();
//        $study_year = DB::table('study_year')->select('id','year')->get();
        $malaka_turi = DB::table('malaka_turi')
            ->select('id','turi')->get();
        $malakas = DB::table('v_malaks')

            ->where('status','=',null)
            ->get();
        return view('livewire.admin.malakas.malakas',compact(['malaka_turi',$malaka_turi,'malakas',$malakas]))->extends('layouts.adminApp');
    }

    public function resetVal()
    {
        $this->turi = '';

    }

    public function showMalaka($id)
    {
        $this->updatedMalaka_id = $id;
        $updatedMalaka = Malaka::find($this->updatedMalaka_id);
        $this->turi = $updatedMalaka->turi;
        $this->kun = $updatedMalaka->kun;
    }

    public function update()
    {
        $valid = $this->validate([
            'turi'=>'required',
            'kun'=>'required'
             ]);
        if ($valid)
        {
            $savedMalaka = Malaka::find($this->updatedMalaka_id);
            if ($this->turi == 1){$ball = 0.2;}
            if ($this->turi == 2){$ball = 0.12;}
            if ($savedMalaka->update([
                'turi'=>$this->turi,
                'kun'=>$this->kun,
                'ball'=>$this->kun*$ball,
                'status'=>1,

            ]))
            {
                $this->resetVal();
                $this->emit('malakatasdiqlandi');
                session()->flash('message','Malak oshirish ma\'lumotlari tasdiqlandi!');
            }
            else
            {
                $this->resetVal();
                $this->emit('malakatasdiqlandi');
                session()->flash('message-dan','Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
            }
        }
    }
    public function deleteid($id)
    {
        $this->deletedMalaka_id = $id;
    }
    public function delete()
    {
        $deletedMalaka = Malaka::find($this->deletedMalaka_id);
        if ($deletedMalaka->delete())
        {
            $this->resetVal();
            $this->emit('malakadeleted');
            session()->flash('message-dan','Malak oshirish ma\'lumotlari o\'chirildi!');
        }
        else
        {
            $this->resetVal();
            $this->emit('malakadeleted');
            session()->flash('message-dan','Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
        }

    }
}
