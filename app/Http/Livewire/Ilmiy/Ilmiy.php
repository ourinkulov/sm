<?php

namespace App\Http\Livewire\Ilmiy;

use App\Models\IlmiyDaraja;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Ilmiy extends Component
{
    public $ilmiydaraja,$id_id,$ilmd,$del_id;
    public function render()
    {
        $this->ilmiydaraja = DB::table('v_ilmiydaraja')->where('status','=',NULL)->get();
        return view('livewire.ilmiy.ilmiy')->extends('layouts.ilmiyApp');
    }
    public function update($id)
    {
        $this->id_id = $id;
    }
    public function ilmiydarajanisaqlash()
    {
        $valid = $this->validate(['ilmd'=>'required']);
        if ($valid)
        {
            $ilmiydarajadb = IlmiyDaraja::find($this->id_id);
            //dd($ilmiydarajadb);
            if ($ilmiydarajadb->update(['ilmiyDaraja'=>$this->ilmd,'status'=>1]))
            {
                $this->emit('ilmiydarajatasdiqlandi');
                session()->flash('message','Tasdiqlandi.');
            }else{
                $this->emit('ilmiydarajatasdiqlandi');
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
        $ilmiydarajadb = IlmiyDaraja::find($this->del_id);
        //dd($ilmiydarajadb);
        if ($ilmiydarajadb->delete())
        {
            $this->emit('ilmiydarajadeleted');
            session()->flash('message','O\'chirildi.');
        }else{
            $this->emit('ilmiydarajadeleted');
            session()->flash('message-dan','Xatolik yuz berdi.');
        }
    }

}
