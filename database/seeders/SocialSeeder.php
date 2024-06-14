<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SocialSeeder extends Seeder
{
    public function run()
    {
        DB::table('social_data')->insert([
            // Company A
            [
                'company_id' => 1,
                'year' => 2023,
                'workforce_diversity' => 45,
                'employee_training_hours' => 2500,
                'safety_incidents' => 4,
                'community_investment' => 200000,
                'created_at' => now(),
                'updated_at' => now()
            ],
            // Company B
            [
                'company_id' => 2,
                'year' => 2023,
                'workforce_diversity' => 50,
                'employee_training_hours' => 3000,
                'safety_incidents' => 3,
                'community_investment' => 250000,
                'created_at' => now(),
                'updated_at' => now()
            ],
            // Company C
            [
                'company_id' => 3,
                'year' => 2023,
                'workforce_diversity' => 55,
                'employee_training_hours' => 2800,
                'safety_incidents' => 3,
                'community_investment' => 220000,
                'created_at' => now(),
                'updated_at' => now()
            ],
            // Company D
            [
                'company_id' => 4,
                'year' => 2023,
                'workforce_diversity' => 60,
                'employee_training_hours' => 3200,
                'safety_incidents' => 2,
                'community_investment' => 180000,
                'created_at' => now(),
                'updated_at' => now()
            ]
        ]);
    }
}
