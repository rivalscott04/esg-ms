<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EnvironmentalData extends Model
{
    use HasFactory;

    protected $table = 'environmental_data';

    protected $fillable = [
        'company_id',
        'year',
        'carbon_emissions',
        'energy_consumption',
        'water_usage',
        'waste_recycled',
    ];
}
