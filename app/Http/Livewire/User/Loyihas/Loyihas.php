<?php

namespace App\Http\Livewire\User\Loyihas;

use App\Models\Loyiha;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithFileUploads;

class Loyihas extends Component
{
    use WithFileUploads;
    public $mavzu,$raqami,$bsana,$ysana,$miqyosi,$buyruq,$ilova,$user_id;
    public $loyiha_turi;
    public $current_loyiha_id;
    public function render()
    {
        $this->user_id = Auth()->user()->getAuthIdentifier();
        $loyihas = DB::table('v_loyihas')
            ->where('user_id','=',$this->user_id)
            ->where('status','=',1)
            ->get();
        //2dd($loyihas);
        $this->loyiha_turi = DB::table('loyiha_turi')->select('id','miqyosi')->get();

        return view('livewire.user.loyihas.loyihas',compact('loyihas',$loyihas))->extends('layouts.userApp2');
    }
    public function resetVal()
    {
        $this->mavzu = '';
        $this->raqami = '';
        $this->bsana = '';
        $this->ysana = '';
        $this->buyruq = '';
        $this->miqyosi = '';
        $this->ilova = '';
    }
    public function store()
    {
        //dd($this->buyruq);
        $valid = $this->validate([
            'miqyosi'=>'required',
            'mavzu'=>'required',
            'raqami'=>'required',
            'bsana'=>'required',
            'ysana'=>'required',
            'buyruq'=>'required',
            'ilova'=>'required',
        ]);
        if ($valid)
            $fileName = time().'_'.$this->ilova->getClientOriginalName();
        $filePath = $this->ilova->storeAs('loyiha',$fileName,'public');
            if ($createdLoyihs = Loyiha::create([
                'miqyosi'=>$this->miqyosi,
                'mavzu'=>$this->mavzu,
                'raqami'=>$this->raqami,
                'bsana'=>$this->bsana,
                'ysana'=>$this->ysana,
                'buyruq'=>$this->buyruq,
                'ilova'=>$fileName,
                'user_id'=>$this->user_id
            ]))
            {
                $this->resetVal();
                $this->emit('loyihakiritildi');
                session()->flash('message', 'Sizning loyihangiz tizimga kiritildi. Tasdiqlash jarayonidan so\'ng Sizga ball ajratiladi. Rahmat');
            } else {

                $this->emit('loyihakiritildi');
                session()->flash('message', 'Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
            }

    }
}
