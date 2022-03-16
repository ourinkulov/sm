<?php

namespace App\Http\Livewire\Admin\Langs;

use App\Models\Lang;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithFileUploads;

class Langs extends Component
{
    use WithFileUploads;
    public $user_id;
    public  $lang_type;
    public $updatedLang_id;
    public $deletedLang_id;
    public function render()
    {
        $this->user_id = Auth::user()->getAuthIdentifier();
//        $lang_names = DB::table('lang_name')->select('id','lang_name')->get();
        $lang_types = DB::table('lang_type')->select('id','lang_type')->get();
        $langs = DB::table('v_langs')
            ->where('status','=',null)
            ->get();

        return view('livewire.admin.langs.langs',compact(['lang_types',$lang_types,'langs',$langs]))->extends('layouts.adminApp');
    }
    public function resetVal()
    {
//        $this->langname_id = '';
        $this->lang_type= '';
    }

    public function showLang($id)
    {
        $this->updatedLang_id = $id;
        $updatedLang = Lang::find($this->updatedLang_id);
        $this->lang_type = $updatedLang->langtype_id;
    }
    public function update()
    {
        $valid = $this->validate([

            'lang_type'=>'required',
//            'bsana'=>'required',
//            'ysana'=>'required',
//            'ilova'=>'required',
        ]);
        if ($valid)
        {
            //dd($this->lang_type);
            if ($this->lang_type == 3){$ball = 10;}
            if ($this->lang_type == 2){$ball = 7.5;}
            if ($this->lang_type == 1){$ball = 5;}
            $savedLang = Lang::find($this->updatedLang_id);
//            $fileName = $this->ilova->getClientOriginalName();
//            $filePath = $this->ilova->storeAs('lang',$fileName,'public');
            if ($savedLang->update([

                'langtype_id'=>$this->lang_type,
                'ball'=>$ball,
                'status'=>1

            ]))
            {
                $this->reset();
                $this->emit('langtasdiqlandi');
                session()->flash('message','Til bilish darajasi tasdiqlandi');

            }
            else
            {
                $this->reset();
                $this->emit('langtasdiqlandi');
                session()->flash('message-dan','Xatolik yuz berdi iltimos qaytadan urinib k\'ring');
            }
        }
    }
    public function deleteid($id)
    {
        $this->deletedLang_id = $id;

    }
    public function delete()
    {
        $deletedLang = Lang::find($this->deletedLang_id);
        if ($deletedLang->delete())
        {
            $this->reset();
            $this->emit('langdeleted');
            session()->flash('message-dan','Til bilish darajasi o\'chirildi');

        }
        else
        {
            $this->reset();
            $this->emit('langdeleted');
            session()->flash('message-dan','Xatolik yuz berdi iltimos qaytadan urinib k\'ring');
        }
    }
}
