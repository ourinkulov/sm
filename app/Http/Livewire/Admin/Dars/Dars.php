<?php

namespace App\Http\Livewire\Admin\Dars;

use App\Models\Dar;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Dars extends Component
{
    public $type,$dars_id,$deleteId,$modalOpen=true;
    public function render()
    {
        $dars = DB::table('v_dars')
            ->select('id','name','kafName','fannomi','type','mavzu','guruh','sana','ilova','ball','statusurok_id')
            ->where('statusurok_id','=',1)
            ->get();
        return view('livewire.admin.dars.dars',compact(['dars',$dars]))->extends('layouts.adminApp');
    }
    public function update($id)
    {

        $this->dars_id = $id;
        //dd($oneDars);
    }
//    public function openModal()
//    {
//        $this->modalOpen = true;
//    }
//    public function hideModal()
//    {
//        $this->modalOpen = false;
//    }
    public function storeorupdate()
    {
        $this->validate([
            'type' => 'required',

        ]);
        $cid = $this->dars_id;
//        Dar::update(['id' => $this->id], [
//            'type' => $this->type,
//
//        ]);
        $update = Dar::find($cid);
        //dd($update);
        if ($this->type==1)
        {
            $ball = 10;
        }
        elseif ($this->type == 2)
        {
            $ball = 5;
        }
        else
        {
            $ball=0;
        }
        $update->update([
            'tipurok_id'=>$this->type,
            'ball'=>$ball,
            'statusurok_id'=>2
        ]);

        session()->flash('message', $this->id ? 'Tasdiqlandi.' : 'Tasdiqlandi.');
//        $this->hideModal();
        $this->emit('darstas');

//        $this->closeModalPopover();
//        $this->resetCreateForm();
    }
    public function deleteId($id)
    {
        $this->deleteId = $id;
    }
    public function delete()
    {
        //dd($id);
        $darsdel = Dar::find($this->deleteId);
        $darsdel->delete();
        session()->flash('message-dan',  'O\'chirildi.');
    }
}
