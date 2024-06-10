<?php

namespace App\Http\Requests;

use App\Enums\RoleUser;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules\Enum;

class PenggunaRequest extends FormRequest
{

    public function authorize(): bool
    {
        return true;
    }


    public function rules(): array
    {
        return [
            "nama" => ["required","string"],
            "no_telp" => ["required","string"],
            "kelurahan_id" => ["required","exists:kelurahan,id"],
            "email" => ["required","email"],
            "alamat" => ["required","string"],
            "username" => ["required","string"],
            "password" => ["required","string"],
            "role" => ["required",(new Enum(RoleUser::class))],
            "bio" => ["required","string"],
            "partai_id" => ["required","exists:partai,id"],
            "is_active" => ["required","boolean"],
        ];
    }

}
