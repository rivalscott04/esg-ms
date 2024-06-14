<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SocialData extends Model
{
    use HasFactory;

    protected $table = 'social_data';

    protected $fillable = [
        'company_id',
        'year',
        'workforce_diversity',
        'employee_training_hours',
        'safety_incidents',
        'community_investment',
    ];
}
