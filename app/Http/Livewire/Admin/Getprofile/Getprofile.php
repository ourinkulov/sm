<?php

namespace App\Http\Livewire\Admin\Getprofile;

use Livewire\Component;

class Getprofile extends Component
{
    public $pas_id;
    public function mount($id)
    {
      $this->pas_id = $id;
    }
    public function render()
    {
        //dd($this->pas_id);
        return view('livewire.admin.getprofile.getprofile')->extends();
    }
}
