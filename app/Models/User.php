<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use App\Enums\RoleUser;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasOneThrough;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class User extends Authenticatable implements HasMedia
{
    use HasApiTokens, HasFactory, Notifiable, HasUuids, InteractsWithMedia;
    protected $keyType = "string";
    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $appends = ['has_permissions'];

    protected $casts = [
        'email_verified_at' => 'datetime',
        'role' => RoleUser::class,
        'password' => 'hashed'
    ];

    public function user_profile(): HasOne
    {
        return $this->hasOne(UserProfile::class, 'user_id');
    }

    protected function hasPermissions(): Attribute
    {
        return new Attribute(
            get: fn () => collect(config('constants.permissions.' . $this->role->value)),
        );
    }
    public function is_admin(): bool
    {
        return $this->role->value == 'admin';
    }

    public function is_super(): bool
    {
        return $this->role->value == 'super';
    }

    public function is_team(): bool
    {
        return $this->role->value == 'team';
    }

    public function is_user(): bool
    {
        return $this->role->value == 'user';
    }
}
