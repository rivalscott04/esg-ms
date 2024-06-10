<?php

namespace App\Http\Livewire;

use App\Models\KabupatenKota;
use App\Models\Registrasi;
use Livewire\Component;

class WilayahAdministrasiTps extends Component
{
    public $kabupaten = [];
    public $kecamatan = [];
    public $kelurahan = [];
    public $tps = [];

    public $kabkotId;
    public $kecamatanId;
    public $kelurahanId;
    public $tpsId;

    public function mount()
    {
        $registrasi = Registrasi::query()
            ->with('dapil.dapilArea')
            ->where('user_id',auth()->id())
            ->whereRelation("event",["is_active"=>true])
            ->first();

        if(auth()->user()->is_user())
        {
            $this->kabupaten = KabupatenKota::query()
                ->with(['kecamatan.kelurahan'])
                ->whereIn("id",$registrasi->dapil->dapilArea->pluck("kabupaten_kota_id")->toArray())
                ->get();
        }else{
            $this->kabupaten = KabupatenKota::with('kecamatan.kelurahan')->get();
        }


        if (!empty($this->kabkotId)) {
            $selectedKab = $this->kabupaten->where('id', $this->kabkotId)->first();
            $this->kecamatan = $selectedKab->kecamatan??collect();
        }

            if (!empty($this->kecamatanId)) {
            $selectedKec = $this->kecamatan->where('id', $this->kecamatanId)->first();
            $this->kelurahan = $selectedKec->kelurahan??collect();
        }

        if (!empty($this->kelurahanId)) {
            $selectedKel = $this->kelurahan->where('id', $this->kelurahanId)->first();
            $this->tps = $selectedKel->tps??collect();
        }
    }
    public function render()
    {
        return view('livewire.wilayah-administrasi-tps');
    }

    public function updatedKabkotId($value)
    {

        if (!empty($value)) {
            $this->kecamatan = [];
            $this->kelurahan = [];
            $selectedKab = $this->kabupaten->where('id', $value)->first();
            if (isset($selectedKab)) {
                $this->kecamatan = $selectedKab->kecamatan;
            }
        }
    }

    public function updatedKecamatanId($value)
    {

        if (!empty($value)) {
            $this->kelurahan = [];
            $selectedKec = $this->kecamatan->where('id', $this->kecamatanId)->first();
            if (isset($selectedKec)) {
                $this->kelurahan = $selectedKec->kelurahan;
            }
        }
    }

    public function updatedKelurahanId($value)
    {

        if (!empty($value)) {
            $this->tps = [];
            $selectedKel = $this->kelurahan->where('id', $this->kelurahanId)->first();
            if (isset($selectedKel)) {
                $this->tps = $selectedKel->tps;
            }
        }
    }
}
