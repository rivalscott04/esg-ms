<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EnvironmentSeeder extends Seeder
{
    public function run()
    {
        DB::table('environmental_data')->insert([
            // Company A
            [
                'company_id' => 1,
                'year' => 2023,
                'carbon_emissions' => 15000,
                'energy_consumption' => 60000,
                'water_usage' => 25000,
                'waste_recycled' => 80,
                'created_at' => now(),
                'updated_at' => now()
            ],
            // Company B
            [
                'company_id' => 2,
                'year' => 2023,
                'carbon_emissions' => 8000,
                'energy_consumption' => 30000,
                'water_usage' => 12000,
                'waste_recycled' => 70,
                'created_at' => now(),
                'updated_at' => now()
            ],
            // Company C
            [
                'company_id' => 3,
                'year' => 2023,
                'carbon_emissions' => 10000,
                'energy_consumption' => 40000,
                'water_usage' => 15000,
                'waste_recycled' => 85,
                'created_at' => now(),
                'updated_at' => now()
            ],
            // Company D
            [
                'company_id' => 4,
                'year' => 2023,
                'carbon_emissions' => 12000,
                'energy_consumption' => 45000,
                'water_usage' => 18000,
                'waste_recycled' => 72,
                'created_at' => now(),
                'updated_at' => now()
            ]
        ]);
    }
}
