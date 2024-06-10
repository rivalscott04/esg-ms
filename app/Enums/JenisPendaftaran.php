<?php

namespace App\Enums;

use App\Traits\EnumsToArray;

enum JenisPendaftaran:string {

    use EnumsToArray;
    case DPR_RI = 'DPR RI';
    case DPRD_PROV = 'DPRD Provinsi';
    case DPRD_KABKOT = "DPRD Kabupaten/Kota";
}
