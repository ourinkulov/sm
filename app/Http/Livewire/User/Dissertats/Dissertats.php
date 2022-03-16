<?php

namespace App\Http\Livewire\User\Dissertats;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use App\Models\Dissertat;
use Livewire\WithFileUploads;

class Dissertats extends Component
{
    use WithFileUploads;
    public $maqomi,$mavzu,$shifr,$nomi,$fan,$tsana,$dalolatnoma,$ysana;
    public $user_id;

    public function render()
    {
        $this->user_id = Auth::user()->getAuthIdentifier();
        $diss_maqomi =  DB::table('diss_maqomi')->select('id','maqomi')->get();
        $diss = DB::table('v_dissertats')
            ->where('status','=',1)
            ->where('user_id','=',$this->user_id)
            ->get();
        return view('livewire.user.dissertats.dissertats',compact(['diss_maqomi',$diss_maqomi],['diss',$diss]))->extends('layouts.userApp2');
    }
    public function store()
    {
        $valid = $this->validate([
            'mavzu'=>'required',
            'maqomi'=>'required',
            'shifr'=>'required',
            'nomi'=>'required',
            'fan'=>'required',
            'tsana'=>'required',
            'ysana'=>'required',
            'dalolatnoma'=>'required',
        ]);
        if ($valid)
        {
            $fileName = time().'_'.$this->dalolatnoma->getClientOriginalName();
            $filePath = $this->dalolatnoma->storeAs('diss', $fileName, 'public');
            if (Dissertat::create([
                'mavzu'=>$this->mavzu,
                'maqomi'=>$this->maqomi,
                'shifr'=>$this->shifr,
                'nomi'=>$this->nomi,
                'fan'=>$this->fan,
                'tsana'=>$this->tsana,
                'user_id'=>$this->user_id,
                'ysana'=>$this->ysana,
                'dalolatnoma'=>$fileName,
            ]))
            {
                $this->resetVal();
                $this->emit('dissertatsiyasaqlandi');
                session()->flash('message','Sizning dissertatsiyangiz tizimga kiritildi. Tasdiqlash jarayonidan so\'ng Sizga ball ajratiladi. Rahmat');
            }
            else
            {

                $this->emit('dissertatsiyasaqlandi');
                session()->flash('message','Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring');
            }
        }
    }

    public function showDiss($id)
    {
        $this->diss_id = $id;
//        $updatedDiss = Dissertat::find($this->diss_id);
//        $this->mavzu = $updatedDiss->mavzu;
//        $this->maqomi = $updatedDiss->maqomi;
    }
    public function update()
    {
        $valid = $this->validate([
            'ysana'=>'required',
            'dalolatnoma'=>'required',

        ]);
        if ($valid)
        {
            $dissdalolatnoma = Dissertat::find($this->diss_id);
            $fileName = time().'_'.$this->dalolatnoma->getClientOriginalName();
            $filePath = $this->dalolatnoma->storeAs('diss', $fileName, 'public');
            //dd($this->maqomi);
            if ($dissdalolatnoma->update([
                'ysana'=>$this->ysana,
                'dalolatnoma'=>$fileName,
                'status'=>1

            ]))
            {
                $this->resetVal();
                $this->emit('dissdalolatnomakiritildi');
                session()->flash('message','Dalolatnoma kiritildi');
            }
            else
            {

                $this->emit('dissdalolatnomakiritildi');
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
}
