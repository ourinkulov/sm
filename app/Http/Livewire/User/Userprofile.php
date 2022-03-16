<?php

namespace App\Http\Livewire\User;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;
use Livewire\WithFileUploads;
use App\Models\Userimage;
use phpDocumentor\Reflection\Types\Integer;
use function PHPUnit\Framework\isEmpty;
use function PHPUnit\Framework\isNull;

class Userprofile extends Component
{
    use WithFileUploads;
    public $born,$malumot,$mutaxassislik,$iioq,$ait,$pit,$user_id;
    public $ilmd,$ilmdi=null,$iu,$iui=null,$profileimage;
    public $profile_id,$profileid,$uilm,$uimage,$uall,$ilm_id,$image_id,$ilmiyDarajaID;
    public function render()
    {

        $this->user_id = Auth::user()->id;
        $this->profile_id = \App\Models\Userprofile::query()->select('id')->where('user_id','=',$this->user_id)->first();
        $this->ilm_id = \App\Models\Ilmprofile::query()->select('id')->where('user_id','=',$this->user_id)->first();
        $this->ilmiyDarajaID = \App\Models\IlmiyDaraja::query()->select('id')->where('user_id','=',$this->user_id)->first();
        $this->image_id = \App\Models\Userimage::query()->select('id')->where('user_id','=',$this->user_id)->first();
        $this->profileid=DB::table('userprofiles')->where('user_id','=',$this->user_id)->count('id');
        $this->uilm=DB::table('ilmprofiles')->where('user_id','=',$this->user_id)->count('id');
        $this->uimage=DB::table('userimages')->where('user_id','=',$this->user_id)->count('id');
        if ($this->profileid == true && $this->uilm == true && $this->uimage == true){$this->uall=true;}else{$this->uall=false;}

        //dd($this->profile_id->id);
        return view('livewire.user.userprofile')->extends('layouts.userApp2');
    }
    public function storeuserprofile()
    {
        $valid = $this->validate([
            'born' => 'required',
            'malumot' => 'required',
            'mutaxassislik' => 'required',
            'iioq' => 'required',
            'ait' => 'required',
            'pit' => 'required',
        ]);
        if ($valid)
        {
            \App\Models\Userprofile::Create([
                'user_id' => $this->user_id,
                'born' => $this->born,
                'malumot' => $this->malumot,
                'mutaxassislik' => $this->mutaxassislik,
                'iioq' => $this->iioq,
                'ait' => $this->ait,
                'pit' => $this->pit,
            ]);
            session()->flash('message', 'Ma\'lumotlaringiz kiritildi.');
            $this->emit('storeuserprofile');
            //return $this->redirect('/user/dashboard');
        }


    }
    public function userilm()
    {
        $valid = $this->validate([
            'iu' => 'required',
            'iui' => 'required',
        ]);
        if ($valid)
        {
//            $fileName = time().'_'.$this->ilmdi->getClientOriginalName();
//            $fileName2 = time().'_'.$this->iui->getClientOriginalName();
            if ($this->iui){$fileName2 = time().'_'.$this->iui->getClientOriginalName();}else{$fileName2 = null;}
//            if ($this->ilmdi){$fileName = time().'_'.$this->ilmdi->getClientOriginalName();}else{$fileName = null;}
//            $filePath = $this->ilmdi->storeAs('diplom', $fileName, 'public');
            $filePath2 = $this->iui->storeAs('diplom', $fileName2, 'public');
            \App\Models\Ilmprofile::Create([
                'user_id' => $this->user_id,
                'iu' => $this->iu,
                'iui' => $fileName2,
            ]);
            session()->flash('message', 'Ma\'lumotlaringiz kiritildi.');
            $this->emit('storeuserilm');
            //return $this->redirect('/user/dashboard');
        }


    }
    public function ilmiyDaraja()
    {
        $valid = $this->validate([
            'ilmd' => 'required',
            'ilmdi' => 'required',

        ]);
        if ($valid)
        {
            $fileName = time().'_'.$this->ilmdi->getClientOriginalName();
            if ($this->ilmdi){$fileName = time().'_'.$this->ilmdi->getClientOriginalName();}else{$fileName = null;}
            $filePath = $this->ilmdi->storeAs('diplom', $fileName, 'public');
            \App\Models\IlmiyDaraja::Create([
                'user_id' => $this->user_id,
                'ilmiyDaraja' => $this->ilmd,
                'ilmiyDarajalova' => $fileName,
                'creator'=>$this->user_id,
            ]);
            session()->flash('message', 'Ma\'lumotlaringiz kiritildi.');
            $this->emit('ilmiyDarajaSaqlandi');
            //return $this->redirect('/user/dashboard');
        }


    }
    public function profileimage()
    {
        $valid = $this->validate(['profileimage'=>'required|image|mimes:jpeg,png,jpg,gif,svg|max:2014']);
        if ($valid)
        {
            $fileName = time().'_'.$this->profileimage->getClientOriginalName();
            //$filePath = $this->ilmdi->storeAs('diplom', $fileName, 'public');
            $filePath = $this->profileimage->storeAs('profileimages',$fileName,'public');
            Userimage::create(
                [
                 'user_id'=>$this->user_id,
                 'profileimage'=>$fileName,
                ]
            );
            session()->flash('message', 'Rasm kiritildi.');
            $this->emit('storeuserimage');
        }
    }
    public function showprofile()
    {
        $userprofile = DB::table('userprofiles')->where('user_id',$this->user_id)->first();
        //dd($userprofile);
        $this->born = $userprofile->born;
        $this->mutaxassislik = $userprofile->mutaxassislik;
        $this->malumot = $userprofile->malumot;
        $this->iioq = $userprofile->iioq;
        $this->ait = $userprofile->ait;
        $this->pit = $userprofile->pit;
    }
    public function profileupdate()
    {
        $userprofile = \App\Models\Userprofile::find($this->profile_id->id);
        $userprofile->update([
            'born'=>$this->born,
            'mutaxassislik'=>$this->mutaxassislik,
            'malumot'=>$this->malumot,
            'iioq'=>$this->iioq,
            'ait'=>$this->ait,
            'pit'=>$this->pit,
        ]);

        session()->flash('message', $this->id ? 'Tasdiqlandi.' : 'Tasdiqlandi.');
//        $this->hideModal();
        $this->emit('profilupdated');
    }
    public function updateilm()
    {
        $userilmInfo = DB::table('ilmprofiles')->where('user_id',$this->user_id)->first();
        if ($userilmInfo)
        {
            $this->iu = $userilmInfo->iu;
            $this->iui = $userilmInfo->iui;
        }

    }
    public function ilmiyDarajaShow()
    {
        $userilmInfo = DB::table('ilmiy_darajas')->where('user_id',$this->user_id)->first();
        if ($userilmInfo)
        {
            $this->ilmd = $userilmInfo->ilmiyDaraja;
            $this->ilmdi = $userilmInfo->ilmiyDarajalova;
        }
    }
    public function userilmupdate()
    {
//        $iui2 = $this->validate([
//            'iui' => 'image|max:1024', // 1MB Max
//        ]);
//        $ilmdi2 = $this->validate([
//            'ilmdi' => 'image|max:1024', // 1MB Max
//        ]);
        $userprofileupdate = \App\Models\Ilmprofile::find($this->ilm_id->id);
            //$fileName = time().'_'.$this->ilmdi->getClientOriginalName();
        $fileName2 = time().'_'.$this->iui->getClientOriginalName();$filePath2 = $this->iui->storeAs('diplom', $fileName2, 'public');
//        $fileName = time().'_'.$this->ilmdi->getClientOriginalName(); $filePath = $this->ilmdi->storeAs('diplom', $fileName, 'public');

//            if (is_null($request->file('iui'))){$fileName2 = $userprofileupdate->iui;}else{$fileName2 = time().'_'.$this->iui->getClientOriginalName();$filePath2 = $this->iui->storeAs('diplom', $fileName2, 'public');}
//            if (is_null($request->file('ilmdi'))){$fileName = $userprofileupdate->ilmdi;}else{$fileName = time().'_'.$this->ilmdi->getClientOriginalName(); $filePath = $this->ilmdi->storeAs('diplom', $fileName, 'public');}


        $userprofileupdate->update([
                'iu' => $this->iu,
                'iui' => $fileName2,
            ]);
            session()->flash('message', 'Ma\'lumotlaringiz yangilandi.');
            $this->emit('storeuserilmupdate');
            //return $this->redirect('/user/dashboard');
        }
    public function ilmiyDarajaUpdate()
    {
//        $iui2 = $this->validate([
//            'iui' => 'image|max:1024', // 1MB Max
//        ]);
//        $ilmdi2 = $this->validate([
//            'ilmdi' => 'image|max:1024', // 1MB Max
//        ]);
        $ilmiyDaraja = \App\Models\IlmiyDaraja::find($this->ilmiyDarajaID->id);
        //dd($ilmiyDaraja);

        $fileName = time().'_'.$this->ilmdi->getClientOriginalName(); $filePath = $this->ilmdi->storeAs('diplom', $fileName, 'public');

//            if (is_null($request->file('iui'))){$fileName2 = $userprofileupdate->iui;}else{$fileName2 = time().'_'.$this->iui->getClientOriginalName();$filePath2 = $this->iui->storeAs('diplom', $fileName2, 'public');}
//            if (is_null($request->file('ilmdi'))){$fileName = $userprofileupdate->ilmdi;}else{$fileName = time().'_'.$this->ilmdi->getClientOriginalName(); $filePath = $this->ilmdi->storeAs('diplom', $fileName, 'public');}


        $yangilandi = $ilmiyDaraja->update([
            'ilmiyDaraja' => $this->ilmd,
            'ilmiyDarajalova' => $fileName,
        ]);
        if ($yangilandi){
            session()->flash('message', 'Ma\'lumotlaringiz yangilandi.');
            $this->emit('ilmiyDrajaYangilandi');
        }

        //return $this->redirect('/user/dashboard');
    }

    public function profileimageupdate()
    {
        $valid = $this->validate(['profileimage'=>'required|image|mimes:jpeg,png,jpg,gif,svg|max:2014']);
        if ($valid)
        {
            $userimage = Userimage::find($this->image_id->id);
            $fileName = time().'_'.$this->profileimage->getClientOriginalName();
            //$filePath = $this->ilmdi->storeAs('diplom', $fileName, 'public');
            $filePath = $this->profileimage->storeAs('profileimages',$fileName,'public');
            $userimage->update(
                ['profileimage'=>$fileName,]
            );
            session()->flash('message', 'Rasm yangilandi.');
            $this->emit('updateuserimage');
        }
    }



}
