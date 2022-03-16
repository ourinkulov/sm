<?php

namespace App\Http\Livewire\Admin\Teachers;

use Illuminate\Support\Facades\DB;
use Livewire\Component;

class Teachers extends Component
{
    public $user_id, $kaf_id='';
//    public $teachers = '';
    public function render()
    {
        $teachers = NULL;

        if ($this->kaf_id != '')
        {
           $teachers = DB::table('v_teachers_reyting_with_kaf_name')
               ->where('kafid',$this->kaf_id)->get();
//           dd($this->teachers);
        }

        $kafedras = DB::table('v_kafedra_bosh_light')->get();
        return view('livewire.admin.teachers.teachers',compact(['kafedras',$kafedras,'teachers',$teachers]))->extends('layouts.adminApp');
    }
}
