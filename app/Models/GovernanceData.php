<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GovernanceData extends Model
{
    use HasFactory;

    protected $table = 'governance_data';

    protected $fillable = [
        'company_id',
        'year',
        'board_independence',
        'executive_compensation',
        'shareholder_rights',
        'business_ethics_policies',
    ];
}
