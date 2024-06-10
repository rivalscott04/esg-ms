<?php

namespace App\Traits;

trait EnumsToArray {
    public static function toArray(): array {
        $array = [];
        foreach (self::cases() as $case) {
            $array[$case->value] = $case->name;
        }
        return $array;
    }
}
