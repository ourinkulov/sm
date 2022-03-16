<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class IlmiyController extends Controller
{
    public function index()
    {
        return view('dashboard.ilmiy.index');
    }
}
