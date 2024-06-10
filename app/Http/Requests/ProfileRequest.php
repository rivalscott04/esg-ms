<?php

namespace App\Http\Requests;

use App\Enums\RoleUser;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules\Enum;

class ProfileRequest extends FormRequest
{

    public function authorize(): bool
    {
        return true;
    }


    public function rules(): array
    {
        return [
            "nama" => ["required", "string"],
            "no_telp" => ["required", "string"],
            "email" => ["required", "email"],
            "alamat" => ["required", "string"],
            "bio" => ["required", "string"],
            "avatar" => ["nullable", "mimes:png,jpg,jpeg", "image"]
        ];
    }
}
