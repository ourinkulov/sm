<?php

namespace App\Http\Livewire\Admin\Messages;

use Livewire\Component;
use App\Models\Message;

class Messages extends Component
{
    public $kafid;
    public $message;
    public $message_id;

    public function render()
    {
        $mes = Message::all()->sortDesc();
        return view('livewire.admin.messages.messages',compact('mes'))->extends('layouts.adminApp');
    }
    public function store()
    {
        $valid = $this->validate([

            'message'=>'required',
        ]);
      if ( Message::create([

          'message'=>$this->message
      ]))
      {
          $this->resetVal();
          $this->emit('elonsaqlandi');
          session()->flash('message','E\'lon saqlandi');
      }
      else
      {
          $this->resetVal();
          $this->emit('elonsaqlandi');
          session()->flash('message-dan','Xatolik yuz berdi');
      }
//        Message::create();
    }
    public function resetVal()
    {
        $this->message='';
        $this->kafid='';
    }

    public function showMessage($id)
    {
        $this->message_id = $id;
        $showedMessage = Message::find($this->message_id);
        $this->message = $showedMessage->message;
        $this->kafid = $showedMessage->kafid;
    }

    public function update()
    {
        $valid = $this->validate([

            'message'=>'required',
        ]);
        if ($valid)
        {
            $message = Message::find($this->message_id);
            if ( $message->update([

                'message'=>$this->message
            ]))
            {
                $this->resetVal();
                $this->emit('elonuzgardi');
                session()->flash('message','E\'lon yangilandi');
            }
            else
            {
                $this->resetVal();
                $this->emit('elonuzgardi');
                session()->flash('message-dan','Xatolik yuz berdi');
            }
        }

    }

    public function deleteId($id)
    {
        $this->message_id = $id;

    }

    public function delete()
    {
        $deletedMessage = Message::find($this->message_id);
        if ($deletedMessage->delete())
        {
            $this->resetVal();
            $this->emit('elondeleted');
            session()->flash('message','E\'lon o\'chirildi');
        }
        else
        {
            $this->resetVal();
            $this->emit('elondeleted');
            session()->flash('message-dan','Xatolik yuz berdi');
        }
    }
}
