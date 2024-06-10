<div class="row mb-3">
    <div class="col-lg-8 col-md-6 col-sm-12 form-group" wire:ignore>
        <label for="">Event</label>
        <select name="event_id" id="event_id" class="form-control selectpicker @error('event_id') parsley-error @enderror"
                data-parsley-required="true" data-size="5" data-live-search="true">
            <option value="">-- Pilih Event --</option>
            @foreach ($event as $ev)
                <option value="{{$ev->id}}" {{ $eventId==$ev->id ? 'selected' : '' }}>{{$ev->keterangan}}</option>
            @endforeach
        </select>
    </div>
    <div class="col-lg-4 col-md-6 col-sm-12 form-group">
        <label for="">Dapil</label>
        <select name="dapil_id" id="dapil_id" class="selectpicker w-100 @error('dapil_id') parsley-error @enderror"
                data-style="btn-default" data-parsley-required data-size="5" data-live-search="true" wire:model="dapilId">
            <option value="">-- Pilih Dapil --</option>
            @foreach(collect($dapil)->groupBy('jenis_pendaftaran') as $jenis=>$item)
                <optgroup label="{{ $jenis }}">
                    @foreach($item as $dpl)
                        <option value="{{ $dpl->id }}" {{ $dapilId==$dpl->id ? 'selected' :'' }}>{{ $dpl->nama }}</option>
                    @endforeach

                </optgroup>
            @endforeach

        </select>
    </div>


</div>

@push('js')
    <script>
        $("#event_id").on('change',function (e){
            @this.set('eventId',$(this).val());
        });

        document.addEventListener('livewire:load', function() {
            $('#dapil_id').selectpicker();

        })
        document.addEventListener('DOMContentLoaded', () => {
            Livewire.hook('element.updating', (fromEl, toEl, component) => {
                $('#dapil_id').selectpicker('destroy');

            })
            Livewire.hook('message.processed', (message, component) => {

                $('#dapil_id').selectpicker();

            })
        });
    </script>
@endpush
