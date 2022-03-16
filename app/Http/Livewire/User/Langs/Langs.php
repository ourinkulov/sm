<?php

namespace App\Http\Livewire\User\Langs;

use App\Models\Lang;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithFileUploads;

class Langs extends Component
{
    use WithFileUploads;
    public $user_id,$langname_id,$langtype_id;
    public $lang_name, $lang_type,$bsana,$ysana,$ilova;
    public function render()
    {
        $this->user_id = Auth::user()->getAuthIdentifier();
        $lang_names = DB::table('lang_name')->select('id','lang_name')->get();
        $lang_types = DB::table('lang_type')->select('id','lang_type')->get();
        $langs = DB::table('v_langs')->where('user_id',$this->user_id)
            ->where('status','=',1)
            ->get();

        return view('livewire.user.langs.langs',compact(['lang_names',$lang_names,'lang_types',$lang_types,'langs',$langs]))->extends('layouts.userApp2');
    }
    public function resetVal()
    {
        $this->langname_id = '';
        $this->langtype_id= '';
    }
    public function store()
    {
        $valid = $this->validate([
            'lang_name'=>'required',
            'lang_type'=>'required',
            'bsana'=>'required',
            'ysana'=>'required',
            'ilova'=>'required',
        ]);
        if ($valid)
        {
            $fileName = $this->ilova->getClientOriginalName();
            $filePath = $this->ilova->storeAs('lang',$fileName,'public');
            if ($savedLang = Lang::create([
                'langname_id'=>$this->lang_name,
                'langtype_id'=>$this->lang_type,
                'bsana'=>$this->bsana,
                'ysana'=>$this->ysana,
                'ilova'=>$fileName,
                'user_id'=>$this->user_id
            ]))
            {
                $this->reset();
                $this->emit('langsaqlandi');
                session()->flash('message','Sizning til bilishingizga oid ma\'lumotlaringiz tizimga kiritildi. Tasdiqlash jarayonidan s\'ng ball ajratiladi. Rahmat');

            }
            else
            {
                $this->reset();
                $this->emit('langsaqlandi');
                session()->flash('message-dan','Xatolik yuz berdi iltimos qaytadan urinib k\'ring');
            }
        }
    }
}
