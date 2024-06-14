<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class GovernmentSeeder extends Seeder
{
    public function run()
    {
        DB::table('governance_data')->insert([
            // Company A
            [
                'company_id' => 1,
                'year' => 2023,
                'board_independence' => 75,
                'executive_compensation' => 6000000,
                'shareholder_rights' => true,
                'business_ethics_policies' => true,
                'created_at' => now(),
                'updated_at' => now()
            ],
            // Company B
            [
                'company_id' => 2,
                'year' => 2023,
                'board_independence' => 80,
                'executive_compensation' => 4500000,
                'shareholder_rights' => true,
                'business_ethics_policies' => true,
                'created_at' => now(),
                'updated_at' => now()
            ],
            // Company C
            [
                'company_id' => 3,
                'year' => 2023,
                'board_independence' => 77,
                'executive_compensation' => 5200000,
                'shareholder_rights' => true,
                'business_ethics_policies' => true,
                'created_at' => now(),
                'updated_at' => now()
            ],
            // Company D
            [
                'company_id' => 4,
                'year' => 2023,
                'board_independence' => 82,
                'executive_compensation' => 4800000,
                'shareholder_rights' => true,
                'business_ethics_policies' => true,
                'created_at' => now(),
                'updated_at' => now()
            ]
        ]);
    }
}
