<?php

namespace App\Http\Livewire\Kafedra;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Livewire\Component;

class Teachers extends Component
{
    public $lavozimid;
    public $name;
    public $email;
    public $password;
    public $creatorid, $kafedraname,$kafedrid;
    public function render()
    {
        $this->kafedraname = Auth::user()->name;
        $this->kafedrid = Auth::user()->kafid;
        $lavozims = DB::table('lavozims')->select('id','lavozim')->get();
        $teachers = DB::table('v_kafedra_teachers')
            ->select('id','name','lavozim','open_pas','email')
            ->where('kafid',$this->kafedrid)
            ->where('role','=',2)->get();

        return view('livewire.kafedra.teachers',compact(['teachers',$teachers,'lavozims',$lavozims]))->extends('layouts.kafedraApp');
    }

    public function resetInput()
    {
        $this->name = '';
        $this->email = '';
        $this->password = '';
        $this->lavozimid = '';

    }
    public function store()
    {

        $valid = $this->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8'],
            'lavozimid'=>'required',
        ]);
        if ($valid)
        {
            //dd($valid);
            $this->creatorid = Auth::user()->getAuthIdentifier();
            $valid['password'] = Hash::make($this->password);
            $valid['role']=2;
            $valid['creatorid']=$this->creatorid;
            //dd($valid['creatorId']);
            $valid['lavozimid']=$this->lavozimid;
            $valid['kafid']=$this->kafedrid;
            $valid['creatorname']=Auth::user()->name;
            $valid['open_pas'] = $this->password;
            $create =  User::create($valid);
            if ($create)
            {
                session()->flash('message-suc','Saqlandi');
            }
            else
            {
                session()->flash('message-dan','Xatolik');
            }
            $this->resetInput();
            $this->emit('teacherSaqlandi');
        }
    }

}
