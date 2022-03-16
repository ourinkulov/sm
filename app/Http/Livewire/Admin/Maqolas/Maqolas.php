<?php

namespace App\Http\Livewire\Admin\Maqolas;

use App\Models\Maqola;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Maqolas extends Component
{
    public $maqola_turi,$maqola_miqyosi;
    public $maqola_turi_id,$maqola_miqyosi_id,$maqola_mavzusi,$maqola_mualliflari,$ilova,$user_id;
    public $maqola_id,$ball;

    public function render()
    {
        $this->user_id = Auth::user()->id;
        $this->maqola_turi = DB::table('maqola_turi')->select('id','turi')->get();
        $this->maqola_miqyosi = DB::table('maqola_miqyosi')->select('id','miqyosi')->where('turi','=',$this->maqola_turi_id)->get();
        $maqolas = DB::table('v_maqolas')
            ->where('status','=',null)
            ->get();
        return view('livewire.admin.maqolas.maqolas',compact('maqolas',$maqolas))->extends('layouts.adminApp');
    }
    public function showMaqola($id)
    {
        $this->maqola_id = $id;
        $maqola = Maqola::find($this->maqola_id);
        $this->maqola_turi_id = $maqola->turi;
        $this->maqola_miqyosi_id = $maqola->miqyosi;
        $this->maqola_mualliflari = $maqola->mualliflik;
    }
    public function update()
    {
        $valid = $this->validate([
            'maqola_turi_id'=>'required',
            'maqola_mualliflari'=>'required|numeric',
            'maqola_miqyosi_id'=>'required',
        ]);
        if ($valid)
        {
            $maqola = Maqola::find($this->maqola_id);
            if ($this->maqola_miqyosi_id==1){$this->ball = 15;}
            if ($this->maqola_miqyosi_id==2){$this->ball = 5;}
            if ($this->maqola_miqyosi_id==3){$this->ball = 3.5;}
            if ($this->maqola_miqyosi_id==4){$this->ball = 5;}
            if ($this->maqola_miqyosi_id==5){$this->ball = 2.5;}
            if ($this->maqola_miqyosi_id==6){$this->ball = 1;}
            if ($this->maqola_miqyosi_id==7 && $this->maqola_miqyosi_id==7){$this->ball = 0.5;}

            if ($maqola->update([
                'turi'=>$this->maqola_turi_id,
                'mualliflik'=>$this->maqola_mualliflari,
                'miqyosi'=>$this->maqola_miqyosi_id,
                'status'=>1,
                'ball'=>$this->ball/$this->maqola_mualliflari
            ]))
            {
                $this->resetVal();
                $this->emit('maqolatasdiqlandi');
                session()->flash('message','Maqola tasdiqlandi !!!');
            }
            else
            {
                $this->resetVal();
                $this->emit('maqolasaqlandi');
                session()->flash('message','Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
            }
        }
    }
    public function resetVal()
    {
        $this->maqola_miqyosi_id = '';
        $this->maqola_mavzusi = '';
        $this->maqola_mualliflari = '';
        $this->maqola_turi_id = '';
        $this->ilova = '';
    }
    public function deleteid($id)
    {
        $this->maqola_id = $id;
    }
    public function delete()
    {
        $maqola = Maqola::find($this->maqola_id);
        if ($maqola->delete())
        {
            $this->resetVal();
            $this->emit('maqoladeleted');
            session()->flash('message-dan','Maqola o\'chirildi !!!');
        }
        else
        {
            $this->resetVal();
            $this->emit('maqoladeleted');
            session()->flash('message','Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
        }
    }
}
