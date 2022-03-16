<?php

namespace App\Http\Livewire\Ilmiy;

use App\Models\IlmiyDaraja;
use App\Models\Ilmprofile;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Ilmiyunvon extends Component
{
    public $ilmiyunvon,$id_id,$iu,$del_id;
    public function render()
    {

        $dotsents = DB::table('v_dotsents')->get();
        $phd = DB::table('v_phd')->get();
        $dsc = DB::table('v_dsc')->get();
        $this->ilmiyunvon = DB::table('v_ilmiyunvo')->where('status','=',NULL)->get();
        return view('livewire.ilmiy.ilmiyunvon')->extends('layouts.ilmiyApp');
    }
    public function update($id)
    {
        $this->id_id = $id;
    }
    public function ilmiyunvonnisaqlash()
    {
        $valid = $this->validate(['iu'=>'required']);
        if ($valid)
        {
            $ilmiydarajadb = Ilmprofile::find($this->id_id);
            //dd($ilmiydarajadb);
            if ($ilmiydarajadb->update(['iu'=>$this->iu,'status'=>1]))
            {
                $this->emit('ilmiyunvontasdiqlandi');
                session()->flash('message','Tasdiqlandi.');
            }else{
                $this->emit('ilmiyunvontasdiqlandi');
                session()->flash('message-dan','Xatolik yuz berdi.');
            }
        }
    }
    public function deleteId($id)
    {
        $this->del_id = $id;
    }
    public function delete()
    {
        $ilmiyunvondb = Ilmprofile::find($this->del_id);
        //dd($ilmiydarajadb);
        if ($ilmiyunvondb->delete())
        {
            $this->emit('ilmiyunvondeleted');
            session()->flash('message-dan','O\'chirildi.');
        }else{
            $this->emit('ilmiyunvondeleted');
            session()->flash('message-dan','Xatolik yuz berdi.');
        }
    }
}
