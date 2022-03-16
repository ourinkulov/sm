<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class KafedraController extends Controller
{
    public function __construct()
    {
        $this->middleware(['isKafedraboshligi','auth']);
    }
    public function index()
    {

        $teachers = DB::table('v_teachers')
            ->where('kafid',Auth::user()->kafid)
            ->get();
        return view('dashboard.kafedra.index',compact('teachers',$teachers));
    }
    public function profile()
    {
        return view('dashboard.kafedra.profile');
    }
}
