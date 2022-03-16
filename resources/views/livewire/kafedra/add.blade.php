<div wire:ignore.self class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">O'qituvchi qo'shish</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" enctype="multipart/form-data">
                    @csrf
                  <div class="row">
                      <div class="col-md-6">
                          <div class="form-group ">
                              <label for="name" >{{ __('Name') }}</label>

                                  <input wire:model.lazy="name" id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                                  @error('name')
                                  <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                  @enderror

                          </div>
                          <div class="form-group ">
                              <label for="password" class="col-form-label ">{{ __('Password') }}</label>


                                  <input wire:model.lazy="password" id="password" type="password" class="form-control" name="password" required >

                                  @error('password')
                                  <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                  @enderror

                          </div>

                      </div>
                      <div class="col-md-6">
                          <div class="form-group ">
                              <label for="email" >{{ __('E-Mail Address') }}</label>
                             <input wire:model.lazy="email" id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" placeholder="kafedraNomi_o'qituvchiFamilya@akadmvd.akd">

                                  @error('email')
                                  <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                  @enderror

                          </div>
                          <div class="form-group">
                              <label for="">{{ __('Lavozim') }}</label>
                              <select wire:model.lazy="lavozimid" name="lavozimID" id="lavozimID" class="form-control">
                                  <option value="0">Lavozimni tanlang</option>
                                  @foreach($lavozims as $item)
                                      <option value="{{$item->id}}">{{$item->lavozim}}</option>
{{--                                  <option value="3">Kafedra boshlig'i </option>--}}
{{--                                  <option value="4">Kafedra boshlig'i o'rinbosari</option>--}}
{{--                                  <option value="2">Katta o'qituvchi</option>--}}
{{--                                  <option value="5">O'qituvchi</option>--}}
{{--                                  <option value="6">Kabinet boshlig'i</option>--}}
                                      @endforeach
                              </select>
                          </div>
{{--                          <div class="form-group ">--}}
{{--                              <label for="password-confirm" class=" col-form-label ">{{ __('Confirm Password') }}</label>--}}


{{--                                  <input wire:model="password" id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">--}}

{{--                          </div>--}}
{{--                          <div class="form-group">--}}
{{--                              <label for="">F.I.O</label>--}}
{{--                              <input type="text" class="form-control" placeholder="Aliev Ali Alievich">--}}
{{--                          </div>--}}
                      </div>
                  </div>
                </form>
                <button type="submit" class="btn btn-primary" wire:click.prevent="store()">Save changes</button>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>
