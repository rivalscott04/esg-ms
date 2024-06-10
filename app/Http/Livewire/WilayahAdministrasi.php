<?php

namespace App\Http\Livewire;

use App\Models\KabupatenKota;
use Livewire\Component;

class WilayahAdministrasi extends Component
{
    public $kabupaten = [];
    public $kecamatan = [];
    public $kelurahan = [];

    public $kabkotId;
    public $kecamatanId;
    public $kelurahanId;

    public function mount()
    {
        $this->kabupaten = KabupatenKota::with('kecamatan.kelurahan')->get();

        if (!empty($this->kabkotId)) {
            $selectedKab = $this->kabupaten->where('id', $this->kabkotId)->first();
            $this->kecamatan = $selectedKab->kecamatan;
        }

        if (!empty($this->kecamatanId)) {
            $selectedKec = $this->kecamatan->where('id', $this->kecamatanId)->first();
            $this->kelurahan = $selectedKec->kelurahan;
        }
    }

    public function render()
    {
        return view('livewire.wilayah-administrasi');
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
}
