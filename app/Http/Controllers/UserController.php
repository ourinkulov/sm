<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use phpDocumentor\Reflection\Types\Collection;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware(['isUser','auth']);
    }
    public function index()
    {
        $user_reyting = DB::select('call Getall(?,?,?)',[Auth::user()->getAuthIdentifier(),'rey1','name1']);
        $toar = collect($user_reyting);
        $val1 = $toar->first();
        $all_soni = DB::table('v_teachers_all_soni')
            ->where('id',Auth::user()->getAuthIdentifier())
            ->first();


        $userprofiles = DB::table('v_userprofile')->where('id',Auth::user()->id)->first();
        return view('dashboard.users.index',compact(['userprofiles',$userprofiles,'val1',$val1,'all_soni',$all_soni]));
    }
    public function changePas(Request $request, $id)
    {
        $userPass = User::query()->select('id')->where('id',$id)->first();
        $pas = Hash::make($request->password);
        $userPass->update(['password'=>$pas]);
        return redirect()->back()->with('message','Parol yangilandi');
    }
}
