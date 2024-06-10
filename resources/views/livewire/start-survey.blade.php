<div class="row">

    <div class="col-lg-12">
        <!-- begin panel -->
        <form wire:submit.prevent="save">

            @if($isFinish == false)
                <div id="soal" class="mb-3 font-weight-bolder">
                    {!! ($selectedQuestion->nomor??'').'.  '.($selectedQuestion->pertanyaan->nama??'') !!}
                </div>
                <div id="jawaban">
                    @if(($selectedQuestion->pertanyaan->tipe_jawaban->value??'')=="IT")
                        <input type="text" id="id-{{ time()  }}" name="jawaban"  wire:model.defer="answers.0"
                               class="form-control" data-parsley-required="true"/>
                    @endif
                    @if(($selectedQuestion->pertanyaan->tipe_jawaban->value??'')=="SO")
                        @foreach ($selectedQuestion->pertanyaan->jawaban??[] as $answer)
                            <div class="radio radio-css mb-2">
                                <input type="radio" id="id-{{$answer->id}}" name="answer_lists"  wire:model.defer="answers.0"
                                value="{{ $answer->nama }}" data-parsley-required="true"/>
                                <label for="id-{{$answer->id}}" style="font-weight: 0 !important;" >
                                    <span class="d-flex">{!! $answer->nama !!}</span></label>
                            </div>
                            @if($answer->with_input)
                                <input type="text" class="form-control" wire:model.defer="tambahan.{{$answer->nama}}">
                            @endif
                        @endforeach
                    @endif

                    @if(($selectedQuestion->pertanyaan->tipe_jawaban->value??'-')=="MC")
                        @foreach ($selectedQuestion->pertanyaan->jawaban??[] as $answer)
                            <div class="checkbox checkbox-css mb-2">
                                <input type="checkbox" id="cssCheckbox{{ $answer->id }}" wire:model.defer="answers" value="{{$answer->nama}}" />
                                <label for="cssCheckbox{{ $answer->id }}">{{ $answer->nama }}</label>
                            </div>

                            @if($answer->with_input)
                                <input type="text" class="form-control" wire:model.defer="tambahan.{{$answer->nama}}">
                            @endif
                        @endforeach
                    @endif
                </div>
            @else
                <h2 class="text-success text-center">SURVEY SUDAH SELESAI !</h2>
            @endif
            <div class="row mt-4">
                <div class="col-12">
                    <button type="button" class="btn btn-danger" wire:click.prevent="goToQuestion({{($selectedQuestion->nomor??0)-1}})"
                            @if((($selectedQuestion->nomor??0)-1)<=0) disabled @endif>
                        Kembali
                    </button>
                    @if($isFinish==false)
                        <button type="submit" class="btn btn-success"
                            @if(!$started || !isset($selectedQuestion) ) disabled @endif id="btn-submit">Simpan & Lanjutkan</button>
                    @else
                        <button type="button" class="btn btn-primary" @if(!$started) disabled @endif
                            wire:click.prevent="simpanSurvey">Simpan Survey</button>
                    @endif
                    <span class="float-end">
                        <button type="button" class="btn btn-warning" wire:click.prevent="goToQuestion({{ $lastAnswer }})">
                            Pertanyaan Terakhir
                        </button>
                    </span>
                </div>
            </div>
        </form>
    </div>

</div>

@push('scripts')
    <script>

        Livewire.on('showAlert',msg => {
            if(msg.type === "ALREADY_EXIST")
                alert('Pelanggan sudah terdaftar dalam survey.. !')

            if(msg.type === "EMPTY_ANSWER")
                alert('Jawaban tidak boleh kosong.. !')
        })



    </script>
@endpush
