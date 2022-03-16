<?php

namespace App\Http\Livewire\Admin\Oneteacher;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Oneteacher extends Component
{
    public $teacher_id;
    public function mount($id)
    {
        $this->teacher_id = $id;

    }
    public function render()
    {
        $user_reyting = DB::select('call Getall(?,?,?)',[$this->teacher_id,'rey1','name1']);
        $toar = collect($user_reyting);
        $val1 = $toar->first();
        $all_soni = DB::table('v_teachers_all_soni')
            ->where('id',$this->teacher_id)
            ->first();


        $userprofiles = DB::table('v_userprofile')->where('id',$this->teacher_id)->first();


        return view('livewire.admin.oneteacher.oneteacher',compact(['userprofiles',$userprofiles,'user_reyting',$user_reyting,'all_soni',$all_soni,'val1',$val1]))->extends('layouts.adminApp');
    }
}
