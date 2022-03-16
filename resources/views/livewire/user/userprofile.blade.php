<div>
    @include('livewire.user.profile')
    @include('livewire.user.profileupdate')
    @include('livewire.user.ilm')
    @include('livewire.user.image')
    @include('livewire.user.changepas')
    @include('livewire.user.ilmprofile')
    @include('livewire.user.imageupdate')
    @include('livewire.user.ilmiy-daraja.ilmiydaraja')
    @include('livewire.user.ilmiy-daraja.ilmiyDarajaKiritish')

    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-4">
                @if(session()->has('message'))
                    <div class="alert alert-success">{{session('message')}}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                @endif
                @if(session()->has('message-dan'))
                    <div class="alert alert-danger">{{session('message-dan')}}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                @endif
            </div>
        </div>
    </div>
    <div class="" style="border-radius: 2%; border-color: white">
        {{--                    <div class="card-header"><strong>{{ __('Umumiy ma\'lumotlar') }}</strong></div>--}}
        <div class="">
            <div class="container">
                <div class="row">
                   @if(!$uall)
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <h6>Profil ma'lumotlarini kiritish</h6>
                                    <table class="table  table-responsive -border-none">
                                        <tr><td><img src="{{asset('resume.png')}}" alt="" style="width: 64px"></td><td><button data-toggle="modal" data-target="#userprofile" class="btn" style="background-color: rgb(3,19,126); color: white"><i class="fa fa-user-edit"></i><span class="ml-2">Profil ma'lumotlarini kiritish</span></button></td></tr>
                                        <tr><td><img src="{{asset('graduation-diploma1.png')}}" alt="" style="width: 64px"></td><td><button data-toggle="modal" data-target="#userprilm" class="btn" style="background-color: rgb(0 35 141); color: white"><i class="fa fa-book-open"></i><span class="ml-2">Ilmiy unvon ma'lumotlarini kiritish</span></button></td></tr>
                                        <tr><td><img src="{{asset('graduation-diploma1.png')}}" alt="" style="width: 64px"></td><td><button data-toggle="modal" data-target="#ilmiyDarajaKiritish" class="btn" style="background-color: rgb(0 35 141); color: white"><i class="fa fa-book-open"></i><span class="ml-2">Ilmiy daraja ma'lumotlarini kiritish</span></button></td></tr>
                                        <tr><td><img src="{{asset('camera.png')}}" alt="" style="width: 64px"></td><td><button data-toggle="modal" data-target="#userimage" class="btn" style="background-color: rgb(0 35 141); color: white"><i class="fa fa-image"></i><span class="ml-2">Rasm joylash</span></button></td></tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    @else
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h6>Profil ma'lumotlarini o'zgartirish</h6>
                                <table class="table  table-responsive -border-none">
                                    <tr><td><img src="{{asset('profile.png')}}" alt="" style="width: 64px;"></td><td><button data-toggle="modal" data-target="#userprofileupdate" wire:click.prevent="showprofile()" class="btn" style="background-color: rgb(0 35 141); color: white"><i class="fa fa-user-edit"></i><span class="ml-2">Profil ma'lumotlarini o'zgartirish</span></button></td></tr>
                                    <tr><td><img src="{{asset('education.png')}}" alt="" style="width: 64px;"></td><td><button data-toggle="modal" wire:click.prevent="updateilm()" data-target="#userilmupdate" class="btn" style="background-color: rgb(0 35 141); color: white"><i class="fa fa-book-open"></i><span class="ml-2">Ilmiy unvon ma'lumotlarini o'zgartirish</span></button></td></tr>
                                    <tr><td><img src="{{asset('education.png')}}" alt="" style="width: 64px;"></td><td><button data-toggle="modal" wire:click.prevent="ilmiyDarajaShow()" data-target="#ilmiyDaraja" class="btn" style="background-color: rgb(0 35 141); color: white"><i class="fa fa-book-open"></i><span class="ml-2">Ilmiy daraja ma'lumotlarini o'zgartirish</span></button></td></tr>
                                    <tr><td><img src="{{asset('image-editing.png')}}" alt="" style="width: 64px;"></td><td><button data-toggle="modal" data-target="#rasmyangilash" class="btn" style="background-color: rgb(0 35 141); color: white"><i class="fa fa-image"></i><span class="ml-2">Rasm o'zgartirish2</span></button></td></tr>
                                    <tr><td><img src="{{asset('password.png')}}" alt="" style="width: 64px;"></td><td>

                                            @csrf
                                            <button data-toggle="modal" data-target="#userpassword" class="btn" style=" background-color: rgb(0 35 141); color: white"><i class="fa fa-passport"></i><span class="ml-2">Parolni o'zgartirish</span></button>
                                        </td></tr>

                                </table>
                            </div>
                        </div>
                    </div>
                       @endif

                </div>
            </div>
        </div>
    </div>
</div>
