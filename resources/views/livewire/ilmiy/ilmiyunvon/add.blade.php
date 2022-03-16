<div wire:ignore.self class="modal fade bd-example-modal-lg" id="ilmiyunvonnitasdiqlash" tabindex="-1" role="dialog" aria-labelledby="ilmiyunvonnitasdiqlash" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ilmiyunvonnitasdiqlash">Ilmiy darajani tasdiqlash</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="">
{{--                    <div class="form-group">--}}
{{--                        <label for="">--}}
{{--                            Fan--}}
{{--                        </label>--}}
{{--                        <select name="" id="" wire:model="subID" class="form-control">--}}
{{--                            <option value="0">Tanlang</option>--}}
{{--                            @foreach($subjects as $item)--}}
{{--                                <option value="{{$item->id}}">{{$item->fannomi}}</option>--}}
{{--                            @endforeach--}}

{{--                        </select>--}}
{{--                    </div>--}}
                    <div class="form-group">
                        <label for="">
                            Ilmiy unvoningiz
                        </label>
                        <select name="iu" id="iu" wire:model="iu" class="form-control">
                            <option value="0">Tanlang</option>
                            <option value="1">Dotsent</option>
                            <option value="2">Professor</option>
                            <option value="5">Mavjud emas</option>
                        </select>
                    </div>
{{--                    <input type="hidden" name="ball" id="darsball" wire:model="ball">--}}

{{--                    <div class="form-group">--}}
{{--                        <label for="">--}}
{{--                            Mavzu--}}
{{--                        </label>--}}
{{--                        <input type="text" wire:model.lazy="mavzu" class="form-control" />--}}
{{--                    </div>--}}
{{--                    <div class="form-group">--}}
{{--                        <label for="">--}}
{{--                            Guruhlar--}}
{{--                        </label>--}}
{{--                        <input type="text" wire:model.lazy="guruh" class="form-control" />--}}
{{--                    </div>--}}
{{--                    <div class="form-group">--}}
{{--                        <label for="">--}}
{{--                            Sana--}}
{{--                        </label>--}}
{{--                        <input type="date" wire:model="sana" class="form-control" />--}}
{{--                    </div>--}}
{{--                    <div class="form-group">--}}
{{--                        <label for="">--}}
{{--                            Ilova--}}
{{--                        </label>--}}
{{--                        <input type="file" wire:model="ilova" class="form-control" />--}}
{{--                    </div>--}}


                      <button class="btn btn-primary" wire:click.prevent="ilmiyunvonnisaqlash()">Saqlash</button>

                </form>
{{--                <form method="POST" enctype="multipart/form-data">--}}
{{--                    @csrf--}}
{{--                  <div class="row">--}}
{{--                      <div class="col-md-6">--}}
{{--                          <div class="form-group ">--}}
{{--                              <label for="name" >{{ __('Name') }}</label>--}}

{{--                                  <input wire:model="name" id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>--}}

{{--                                  @error('name')--}}
{{--                                  <span class="invalid-feedback" role="alert">--}}
{{--                                        <strong>{{ $message }}</strong>--}}
{{--                                    </span>--}}
{{--                                  @enderror--}}

{{--                          </div>--}}
{{--                          <div class="form-group ">--}}
{{--                              <label for="password" class="col-form-label ">{{ __('Password') }}</label>--}}


{{--                                  <input wire:model="password" id="password" type="password" class="form-control" name="password" required >--}}

{{--                                  @error('password')--}}
{{--                                  <span class="invalid-feedback" role="alert">--}}
{{--                                        <strong>{{ $message }}</strong>--}}
{{--                                    </span>--}}
{{--                                  @enderror--}}

{{--                          </div>--}}

{{--                      </div>--}}
{{--                      <div class="col-md-6">--}}
{{--                          <div class="form-group ">--}}
{{--                              <label for="email" >{{ __('E-Mail Address') }}</label>--}}
{{--                             <input wire:model="email" id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email">--}}

{{--                                  @error('email')--}}
{{--                                  <span class="invalid-feedback" role="alert">--}}
{{--                                        <strong>{{ $message }}</strong>--}}
{{--                                    </span>--}}
{{--                                  @enderror--}}

{{--                          </div>--}}
{{--                          <div class="form-group">--}}
{{--                              <label for="">{{ __('Lavozim') }}</label>--}}
{{--                              <select wire:model="lavozimID" name="lavozimID" id="lavozimID" class="form-control">--}}
{{--                                  <option value="0">Lavozimni tanlang</option>--}}
{{--                                  <option value="1">Kafedra boshlig'i</option>--}}
{{--                                  <option value="2">Katta o'qituvchi</option>--}}
{{--                              </select>--}}
{{--                          </div>--}}
{{--                          <div class="form-group ">--}}
{{--                              <label for="password-confirm" class=" col-form-label ">{{ __('Confirm Password') }}</label>--}}


{{--                                  <input wire:model="password" id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">--}}

{{--                          </div>--}}
{{--                          <div class="form-group">--}}
{{--                              <label for="">F.I.O</label>--}}
{{--                              <input type="text" class="form-control" placeholder="Aliev Ali Alievich">--}}
{{--                          </div>--}}
{{--                      </div>--}}
{{--                  </div>--}}
{{--                </form>--}}
{{--                <button type="submit" class="btn btn-primary" wire:click.prevent="store()">Save changes</button>--}}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Yopish</button>

            </div>
        </div>
    </div>
</div>
