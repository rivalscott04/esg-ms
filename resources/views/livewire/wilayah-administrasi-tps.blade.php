<div class="row mb-3">
    <div class="col-lg-4 col-md-12 col-sm-12 form-group" wire:ignore>
        <label for="">Kabupaten / Kota</label>
        <select name="kabupaten_kota_id" id="kabupaten_kota_id" class="form-control selectpicker @error('kabupaten_kota_id') parsley-error @enderror"
                data-parsley-required="true" data-size="5" data-live-search="true">
            <option value="">-- Pilih Kabupaten/Kota --</option>
            @foreach ($kabupaten as $kab)
                <option value="{{$kab->id}}" {{ $kabkotId==$kab->id ? 'selected' : '' }}>{{$kab->nama}}</option>
            @endforeach
        </select>
    </div>
    <div class="col-lg-4 col-md-12 col-sm-12 form-group">
        <label for="">Kecamatan</label>
        <select name="kecamatan_id" id="kecamatan_id" class="form-control @error('kecamatan_id') parsley-error @enderror" data-parsley-required="true"
                data-size="5" data-live-search="true" wire:model="kecamatanId">
            <option value="">-- Pilih Kecamatan --</option>
            @foreach ($kecamatan as $kec)
                <option value="{{$kec->id}}" {{ $kecamatanId==$kec->id ? 'selected' : '' }}>{{$kec->nama}}</option>
            @endforeach
        </select>
    </div>
    <div class="col-lg-4 col-md-12 col-sm-12 form-group" >
        <label for="">Kelurahan</label>
        <select name="kelurahan_id" id="kelurahan_id" class="form-control @error('kelurahan_id') parsley-error @enderror" data-parsley-required="true"
                data-size="5" data-live-search="true" wire:model="kelurahanId" >
            <option value="">-- Pilih Kelurahan --</option>
            @foreach ($kelurahan as $kel)
                <option value="{{$kel->id}}" {{ $kelurahanId==$kel->id ? 'selected' : '' }}>{{$kel->nama}}</option>
            @endforeach
        </select>
    </div>
    <div class="col-lg-12 col-md-12 col-sm-12 form-group" style="margin-top: 10px">
        <label for="">TPS</label>
        <select name="tps_id[]" id="tps_id" class="form-control @error('tps_id') parsley-error @enderror" data-parsley-required="true"
                data-size="5" data-live-search="true" wire:model="tpsId" multiple>
            <option value="">-- Pilih TPS --</option>
            @foreach ($tps as $dt)
                <option value="{{$dt->id}}" {{ in_array($dt->id,$tpsId)? 'selected' : '' }}>{{$dt->nama}}</option>
            @endforeach
        </select>
    </div>
</div>

@push('js')
    <script>
        $("#kabupaten_kota_id").on('change',function (e){
            @this.set('kabkotId',$(this).val());
        });

        document.addEventListener('livewire:load', function() {
            $('#kecamatan_id').selectpicker();
            $('#kelurahan_id').selectpicker();
            $('#tps_id').selectpicker();
        })
        document.addEventListener('DOMContentLoaded', () => {
            Livewire.hook('element.updating', (fromEl, toEl, component) => {
                $('#kecamatan_id').selectpicker('destroy');
                $('#kelurahan_id').selectpicker('destroy');
                $('#tps_id').selectpicker('destroy');
            })
            Livewire.hook('message.processed', (message, component) => {

                $('#kecamatan_id').selectpicker();
                $('#kelurahan_id').selectpicker();
                $('#tps_id').selectpicker();
            })
        });
    </script>
@endpush
