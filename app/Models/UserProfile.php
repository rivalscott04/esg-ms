<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Znck\Eloquent\Relations\BelongsToThrough;

class UserProfile extends Model
{
    use HasFactory,\Znck\Eloquent\Traits\BelongsToThrough, HasUuids;
    protected $keyType = 'string';
    protected $hidden = ['id',"user_id","partai_id","kelurahan_id"];
    protected $table = "users_profile";


    public function partai() : BelongsTo
    {
        return $this->belongsTo(Partai::class,'partai_id');
    }

    public function kelurahan() : BelongsTo
    {
        return $this->belongsTo(Kelurahan::class,'kelurahan_id');
    }

    public function kecamatan() : BelongsToThrough
    {
        return $this->belongsToThrough(Kecamatan::class,Kelurahan::class,null,'',[Kelurahan::class=>'kelurahan_id']);
    }

    public function kabupaten_kota() : BelongsToThrough
    {
        return $this->belongsToThrough(KabupatenKota::class,[Kecamatan::class,Kelurahan::class],null,'',
        [
            Kecamatan::class => "kecamatan_id",
            Kelurahan::class => "kelurahan_id",
            KabupatenKota::class => "kabupaten_kota_id"
        ]);
    }
}
