<?php

namespace App\Enums;

use App\Traits\EnumsToArray;

enum SatuanBarang:string {

    use EnumsToArray;
    case PCS = "PCS";
    case BOX = "BOX";
    case LUSIN = "LUSIN";
    case RIM = "RIM";



    public function getDescription() : string
    {
        return match ($this) {
            self::SUPER => "Super Admin",
            self::ADMIN => "Administrator",
            self::TEAM => "Team User",
            self::USER => "Basic User",
        };
    }
}
