<?php

use Illuminate\Support\Facades\Route;
//use App\Http\Controllers\AdminController;
//use App\Http\Controllers\UserController;
//use App\Http\Controllers\KafedraController;
use App\Http\Livewire\Kafedra\Teachers;
use App\Http\Livewire\User\Dars;
use App\Http\Livewire\Admin\Dars\Dars as Admindars;
use App\Http\Livewire\Ilmiy\Ilmiy;
use App\Http\Livewire\User\Maqola\Maqola;
use App\Http\Livewire\Admin\Maqolas\Maqolas;
use App\Http\Livewire\User\Dissertats\Dissertats;
use App\Http\Livewire\Admin\Dissertats\Dissertats as AdminDissertats;
use App\Http\Livewire\User\Materials\Materials;
use App\Http\Livewire\Admin\Materials\Materials as AdminMaterials;
use App\Http\Livewire\User\Patents\Patents;
use App\Http\Livewire\Admin\Patents\Patents as AdminPatents;
use App\Http\Livewire\User\Loyihas\Loyihas;
use App\Http\Livewire\Admin\Loyihas\Loyihas as AdminLoyiha;
use App\Http\Livewire\User\Langs\Langs;
use App\Http\Livewire\Admin\Langs\Langs as AdminLangs;
use App\Http\Livewire\User\Kurs\Kurs;
use App\Http\Livewire\Admin\Kurs\Kurs as AdminKurs;
use App\Http\Livewire\User\Malakas\Malakas;
use App\Http\Livewire\Admin\Malakas\Malakas as AdminMalakas;
use App\Http\Livewire\Ilmiy\Professors\Professors;
use App\Http\Livewire\Ilmiy\Dsc\Dsc;
use App\Http\Livewire\Ilmiy\Phd\Phd;
use App\Http\Livewire\Ilmiy\IlmdarajaIlmunvonno\IlmdarajaIlmunvonno;
use App\Http\Livewire\Admin\Professors\Professors as AdminProfessors;
use App\Http\Livewire\Admin\Dotsents\Dotsents;
use App\Http\Livewire\Admin\Dsc\Dsc as AdminDsc;
use App\Http\Livewire\Admin\Phd\Phd as AdminPhd;
use App\Http\Livewire\Admin\Noilmiy\Noilmiy;
use App\Http\Livewire\Admin\Teachers\Teachers as AdminTeachers;
use App\Http\Livewire\Admin\Oneteacher\Oneteacher;
use App\Http\Livewire\Admin\Getprofile\Getprofile;
use App\Http\Livewire\Admin\Showmaqolas\Showmaqolas;
use App\Http\Livewire\Admin\Showpatents\Showpatents;
use App\Http\Livewire\Admin\Showmaterials\Showmaterials;
use App\Http\Livewire\Admin\Showdars\Showdars;
use App\Http\Livewire\Admin\Showkurs\Showkurs;
use App\Http\Livewire\Admin\Showmalakas\Showmalakas;
use App\Http\Livewire\User\Download\Download;
use App\Http\Livewire\Admin\Messages\Messages;
use App\Http\Livewire\User\Messages\Messages as UserMessages;
use App\Http\Livewire\User\Oldmaqola\Oldmaqola;
use App\Http\Livewire\Admin\Reytings\Reytings;
use App\Http\Livewire\User\Reyting\Reyting;
use App\Http\Livewire\User\Showall\Showall;
use App\Http\Livewire\Admin\Pedmaxorats\Pedmaxorats;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::middleware(['middleware'=>'PreventBackHistory'])->group(function (){
    Auth::routes();
});



Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::group(['prefix'=>'admin','middleware'=>['isAdmin','auth','PreventBackHistory']], function (){
    Route::get('dashboard','AdminController@index')->name('admin.dashboard');
    Route::get('profile','AdminController@profile')->name('admin.profile');
    Route::get('kafedra',Kafedra::class)->name('admin.kafedra');
    Route::get('admindars',Admindars::class)->name('admin.dars');
    Route::get('maqolas',Maqolas::class)->name('admin.maqolas');
    Route::get('dissertats',AdminDissertats::class)->name('admin.dissertats');
    Route::get('materials',AdminMaterials::class)->name('admin.materials');
    Route::get('patents',AdminPatents::class)->name('admin.patents');
    Route::get('loyiha',AdminLoyiha::class)->name('admin.loyiha');
    Route::get('lang',AdminLangs::class)->name('admin.lang');
    Route::get('kurs',AdminKurs::class)->name('admin.kurs');
    Route::get('malaka',AdminMalakas::class)->name('admin.malaka');
    Route::get('professors',AdminProfessors::class)->name('admin.professors');
    Route::get('dotsent',Dotsents::class)->name('admin.dotsent');
    Route::get('dsc',AdminDsc::class)->name('admin.dsc');
    Route::get('phd',AdminPhd::class)->name('admin.phd');
    Route::get('noilmiy',Noilmiy::class)->name('admin.noilmiy');
    Route::get('teachers',AdminTeachers::class)->name('admin.teachers');
    Route::get('oneteacher/{id?}',Oneteacher::class)->name('admin.oneteacher');
    Route::get('getprofile/{id}',Getprofile::class);
    Route::get('showmaqolas',Showmaqolas::class)->name('admin.showmaqolas');
    Route::get('showpatents',Showpatents::class)->name('admin.showpatents');
    Route::get('showmaterials',Showmaterials::class)->name('admin.showmaterials');
    Route::get('showdars',Showdars::class)->name('admin.showdars');
    Route::get('showkurs',Showkurs::class)->name('admin.showkurs');
    Route::get('showmalakas',Showmalakas::class)->name('admin.showmalakas');
    Route::get('messages',Messages::class)->name('admin.messages');
    Route::get('reytings',Reytings::class)->name('admin.reytings');
    Route::get('pedmaxorat',Pedmaxorats::class)->name('admin.pedmaxorat');

});
Route::group(['prefix'=>'user','middleware'=>['isUser','auth','PreventBackHistory']],function () {
    Route::get('dashboard', 'UserController@index')->name('user.dashboard');
    Route::get('profile', 'UserController@profile')->name('user.profile');
    Route::get('settings','UserController@settings')->name('user.settings');
    Route::get('dars', Dars::class)->name('user.dars');
    Route::get('userprofile', Userprofile::class)->name('user.userprofile');
    Route::get('changepas/{id}', 'UserController@changePas')->name('user.changepas');
    Route::get('maqolas',Maqola::class)->name('user.maqola');
    Route::get('dissertats',Dissertats::class)->name('user.dissertats');
    Route::get('materials',Materials::class)->name('user.materials');
    Route::get('patents',Patents::class)->name('user.patents');
    Route::get('loyiha',Loyihas::class)->name('user.loyiha');
    Route::get('lang',Langs::class)->name('user.lang');
    Route::get('kurs',Kurs::class)->name('user.kurs');
    Route::get('malaka',Malakas::class)->name('user.malaka');
    Route::get('download',Download::class);
    Route::get('messages',UserMessages::class)->name('user.messages');
    Route::get('oldmaqola',Oldmaqola::class)->name('user.oldmaqola');
    Route::get('reyting',Reyting::class)->name('user.reyting');
    Route::get('showall/{id}',Showall::class)->name('user.showall');
});

Route::group(['prefix'=>'kafedra','middleware'=>['isKafedraboshligi','auth','PreventBackHistory']],function (){
    Route::get('dashboard','KafedraController@index')->name('kafedra.dashboard');
    Route::get('profile','KafedraController@profile')->name('kafedra.profile');
    Route::get('addTeacher',Teachers::class)->name('kafedra.addTeacher');
    Route::get('darskafedra',Urok::class)->name('kafedra.darskafedra');
});
Route::group(['prefix'=>'ilmiy','middleware'=>['isIlmiy','auth','PreventBackHistory']],function (){
    Route::get('dashboard','IlmiyController@index')->name('ilmiy.dashboard');
    Route::get('ilmiydaraja',Ilmiy::class)->name('ilmiy.ilmiydaraja');
    Route::get('ilmiyunvon',Ilmiyunvon::class)->name('ilmiy.ilmiyunvon');
    Route::get('professors',Professors::class)->name('ilmiy.professors');
    Route::get('dotsents',Dotsent::class)->name('ilmiy.dotsents');
    Route::get('dsc',Dsc::class)->name('ilmiy.dsc');
    Route::get('phd',Phd::class)->name('ilmiy.phd');
    Route::get('idiume',IlmdarajaIlmunvonno::class)->name('ilmiy.idiume');




//    Route::get('addTeacher',Teachers::class)->name('kafedra.addTeacher');
//    Route::get('darskafedra',\App\Http\Livewire\Kafedra\Urok::class)->name('kafedra.darskafedra');
});




