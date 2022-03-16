<?php

namespace App\Http\Livewire\Admin\Loyihas;

use App\Models\Loyiha;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Loyihas extends Component
{
    public $mavzu,$raqami,$bsana,$ysana,$miqyosi,$buyruq,$ilova,$user_id;
    public $loyiha_turi;
    public $current_loyiha_id,$deletedLoyiha_id,$updatedLoyiha_id;
    public function render()
    {
        $loyihas = DB::table('v_loyihas')
            ->where('status','=',null)->get();
        $this->loyiha_turi = DB::table('loyiha_turi')->select('id','miqyosi')->get();
        $this->user_id = Auth()->user()->getAuthIdentifier();
        return view('livewire.admin.loyihas.loyihas',compact('loyihas',$loyihas))->extends('layouts.adminApp');
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
    public function update()
    {
        //dd($this->buyruq);
        $valid = $this->validate([
            'miqyosi'=>'required',

        ]);
        if ($valid)
//            $fileName = time().'_'.$this->ilova->getClientOriginalName();
//        $filePath = $this->ilova->storeAs('loyiha',$fileName,'public');
            $updatedLoyiha = Loyiha::find($this->updatedLoyiha_id);
        if ($this->miqyosi == 1){$ball = 15;}
        if ($this->miqyosi == 2){$ball = 7.5;}
        if ($this->miqyosi == 3){$ball = 10;}
        if ($this->miqyosi == 4){$ball = 5;}
        if ($updatedLoyiha->update([
            'miqyosi'=>$this->miqyosi,
            'ball'=>$ball,
            'status'=>1
        ]))
        {
            $this->resetVal();
            $this->emit('loyihatasdiqlandi');
            session()->flash('message', 'Loyiha tasdiqlandi');
        } else {

            $this->emit('loyihatasdiqlandi');
            session()->flash('message', 'Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
        }

    }

    public function showLoyiha($id)
    {
        $this->updatedLoyiha_id = $id;
        $updatedLoyiha = Loyiha::find($this->updatedLoyiha_id);
        $this->miqyosi = $updatedLoyiha->miqyosi;
    }


     public function deleteid($id)
     {
         $this->deletedLoyiha_id = $id;
     }

     public function delete()
     {
         $deletedLoyiha = Loyiha::find($this->deletedLoyiha_id);
         if ($deletedLoyiha->delete())
         {
             $this->resetVal();
             $this->emit('loyihadeleted');
             session()->flash('message-dan', 'Loyiha o\'chirildi');
         } else {

             $this->emit('loyihadeleted');
             session()->flash('message-dan', 'Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
         }


     }

}
