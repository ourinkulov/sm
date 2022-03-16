<?php

namespace App\Http\Livewire\Admin\Pedmaxorats;

use Livewire\Component;

class Pedmaxorats extends Component
{
    public function render()
    {
        return view('livewire.admin.pedmaxorats.pedmaxorats')->extends('layouts.adminApp');
    }
}
