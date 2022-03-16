<?php

namespace App\Http\Livewire\User\Maqola;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use App\Models\Maqola as Maqolas;
use Livewire\WithFileUploads;

class Maqola extends Component
{
    use WithFileUploads;
    public $maqola_turi,$maqola_miqyosi;
    public $maqola_turi_id,$maqola_miqyosi_id,$maqola_mavzusi,$maqola_mualliflari,$ilova,$user_id;
    public function render()
    {
        $this->user_id = Auth::user()->id;
        $this->maqola_turi = DB::table('maqola_turi')->select('id','turi')->get();
        $this->maqola_miqyosi = DB::table('maqola_miqyosi')->select('id','miqyosi')->where('turi','=',$this->maqola_turi_id)->get();
        $maqolas = DB::table('v_maqolas')
            ->where('user_id','=',$this->user_id)
            ->where('status','=',1)
            ->get();
        return view('livewire.user.maqola.maqola',compact('maqolas',$maqolas))->extends('layouts.userApp2');
    }
    public function store()
    {
        $valid = $this->validate([
           'maqola_turi_id'=>'required',
           'maqola_mavzusi'=>'required',
           'maqola_mualliflari'=>'required|numeric',
           'maqola_miqyosi_id'=>'required',
           'ilova'=>'required'
        ]);
        if ($valid)
        {
            $fileName = time().'_'.$this->ilova->getClientOriginalName();
            $filePath = $this->ilova->storeAs('maqolalar', $fileName, 'public');
            if (Maqolas::create([
                'turi'=>$this->maqola_turi_id,
                'mavzu'=>$this->maqola_mavzusi,
                'mualliflik'=>$this->maqola_mualliflari,
                'miqyosi'=>$this->maqola_miqyosi_id,
                'ilova'=>$fileName,
                'user_id'=>$this->user_id
            ]))
            {
                $this->resetVal();
                $this->emit('maqolasaqlandi');
                session()->flash('message','Sizning maqolangiz tizimga kiritildi. Tasdiqlash jarayonidan so\'ng Sizga ball ajratiladi. Rahmat');
            }
            else
            {

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
}
