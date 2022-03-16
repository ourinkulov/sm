<?php

namespace App\Http\Livewire\User;

use App\Models\DarTyp;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use App\Models\Dar;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Livewire\WithFileUploads;


class Dars extends Component
{
    use WithFileUploads;
    public $user_id,$type,$username,$subjects,$subID,$mavzu,$ilova,$sana,$guruh,$kid;

    /**
     * @throws \Exception
     */
    public function render()
    {
        $this->subjects=DB::table('v_subjecttokafedra')->get();
        $this->username=Auth::user()->name;
        $this->user_id = Auth::user()->id;
        $this->kid = Auth::user()->kafid;

//        $dars = cache()->remember('user-dars1',60*60*24,function ()
//        {
//            return
//                DB::table('v_dars')
//                    ->select('id','name','kafName','fannomi','type','mavzu','guruh','sana','ilova','ball','status')
//                    ->where('statusurok_id','=',2)
//                    ->get();
//        });
        $dars = DB::table('v_dars')
                    ->select('id','name','kafName','fannomi','type','mavzu','guruh','sana','ilova','ball','statusurok_id')
                    ->where('statusurok_id','=',2)
            ->where('user_id','=',$this->user_id)
                    ->get();

        $turi = cache()->remember('user-dars',60*60*24,function ()
        {
            return DB::table('users')->get();
        });

        //dd(Dar::all());

        return view('livewire.user.dars',compact(['dars',$dars],['turi',$turi]))->extends('layouts.userApp2');

    }
    private function resetCreateForm(){
        $this->type = '';

    }
    public function store()
    {

        $this->validate([
            'type' => 'required',
            'mavzu' => 'required',
            'guruh' => 'required',
            'sana' => 'required',
            'ilova' => 'required',
            'subID' => 'required',
        ]);
        $fileName = time().'_'.$this->ilova->getClientOriginalName();
        $filePath = $this->ilova->storeAs('dars', $fileName, 'public');

        Dar::Create([

            'type' => $this->type,
            'subject_id' => $this->subID,
            'tipurok_id' => $this->type,
            'statusurok_id' => 1,
            'mavzu' => $this->mavzu,
            'guruh' => $this->guruh,
            'sana' => $this->sana,
            'ilova' => $fileName,
            'user_id'=>$this->user_id,
            'kid'=> $this->kid

        ]);

        session()->flash('message', 'Xurmatli '.$this->username .' ma\'lumotongiz kiritildi. Tasdiqlash jarayonidan so\'ng Sizga ball ajratiladi');
        $this->resetCreateForm();
        $this->emit('darsturiSaqlandi');
    }
//    public function openModalPopover()
//    {
//        $this->isModalOpen = true;
//    }
//
//    public function closeModalPopover()
//    {
//
//        $this->isModalOpen = false;
//    }

}
