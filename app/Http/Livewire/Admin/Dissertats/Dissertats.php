<?php

namespace App\Http\Livewire\Admin\Dissertats;

use App\Models\Dissertat;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Dissertats extends Component
{
    public $maqomi,$mavzu,$shifr,$nomi,$fan,$tsana,$dalolatnoma,$ysana;
    public $user_id,$diss_id;



    public function render()
    {
        $this->user_id = Auth::user()->id;
        $diss_maqomi =  DB::table('diss_maqomi')->select('id','maqomi')->get();
        $diss = DB::table('v_dissertats')->where('status','=',null)->get();
        //dd($diss);
        return view('livewire.admin.dissertats.dissertats',compact(['diss_maqomi',$diss_maqomi,'diss',$diss]))->extends('layouts.adminApp');
    }
    public function showDiss($id)
    {
        $this->diss_id = $id;
        $updatedDiss = Dissertat::find($this->diss_id);
        $this->mavzu = $updatedDiss->mavzu;
        $this->maqomi = $updatedDiss->maqomi;
    }
    public function update()
    {
        $valid = $this->validate([
            'maqomi'=>'required',
        ]);
        if ($valid)
        {
            if ($this->maqomi == 1){$ball = 12.5;}
            if ($this->maqomi == 2){$ball = 35;}
            $dissertatsiyanitasdiqlash = Dissertat::find($this->diss_id);
            //dd($this->maqomi);
            if ($dissertatsiyanitasdiqlash->update([
                'maqomi'=>$this->maqomi,
                'status'=>1,
                'ball'=>$ball
            ]))
            {
                $this->resetVal();
                $this->emit('dissertatsiyatasdiqlandi');
                session()->flash('message','Tasdiqlandi');
            }
            else
            {

                $this->emit('dissertatsiyatasdiqlandi');
                session()->flash('message','Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
            }
        }
    }
    public function resetVal()
    {
        $this->mavzu= '';
        $this->maqomi = '';
        $this->fan = '';
        $this->shifr = '';
        $this->nomi = '';
        $this->tsana = '';
    }
    public function deleteid($id)
    {
        $this->diss_id = $id;
    }
    public function delete()
    {
        $deletedDiss = Dissertat::find($this->diss_id);
        if ($deletedDiss->delete())
        {
            $this->resetVal();
            $this->emit('dissertatsiyauchirildi');
            session()->flash('message-dan','Dissertatsiya o\'chirildi');
        }
        else
        {

            $this->emit('dissertatsiyauchirildi');
            session()->flash('message-dan','Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
        }
    }
}
