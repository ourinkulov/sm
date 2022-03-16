<?php

namespace App\Http\Livewire\User\Messages;

use Livewire\Component;
use App\Models\Message;

class Messages extends Component
{
    public function render()
    {
        $mes = Message::all()->sortDesc();
        return view('livewire.user.messages.messages',compact('mes'))->extends('layouts.userApp2');
    }
}
