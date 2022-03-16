<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\PDF;
class AdminController extends Controller
{
    public function index()
    {
//        return view('dashboard.admins.index');
//        dd('Ok');
        $malakas_soni = DB::table('v_malaks')->count();
        $maqola_soni = DB::table('v_maqolas')->count();
        $kurs_soni = DB::table('v_kurs')->count();
        $diss_soni = DB::table('v_dissertats')->count();
        $dars_soni = DB::table('v_dars')->count();
        $material_soni = DB::table('v_materials')->count();
        $patent_soni = DB::table('v_patents')->count();
        $teacher_soni = DB::table('v_teachers')->count();
        $kafedra_soni = DB::table('kafedras')->count();
        //dd($malakas_soni);
        $teach_reyting  = DB::table('v_teachers_reyting_with_kaf_name')->limit(5)->get();
        $kafedra_reyting = DB::table('v_kafedra_reyting')->get();
        $ilmiy_reyting = DB::table('v_ilmiy_reyting')->get();
        $pedagogik_reyting = DB::table('v_pedagogik_reyting')->get();
        return view('dashboard.admins.index',
            compact([
            'teach_reyting',$teach_reyting,
            'kafedra_reyting',$kafedra_reyting,
            'malakas_soni',$malakas_soni,
            'maqola_soni',$maqola_soni,
            'kurs_soni',$kurs_soni,
            'diss_soni',$diss_soni,
            'dars_soni',$dars_soni,
            'material_soni',$material_soni,
            'patent_soni',$patent_soni,
            'teacher_soni',$teacher_soni,
            'kafedra_soni',$kafedra_soni,
                'pedagogik_reyting',
                'ilmiy_reyting'

        ]));
    }

}
