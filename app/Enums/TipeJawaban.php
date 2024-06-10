<?php

namespace App\Enums;

use App\Traits\EnumsToArray;

enum TipeJawaban:string {

    use EnumsToArray;
    case INPUT_TEXT = 'IT';
    case SINGLE_OPTION = 'SO';
    case MULTIPLE_CHOICE = "MC";
}
