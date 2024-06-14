<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\User;
use Illuminate\Database\Seeder;
use Database\Seeders\SocialSeeder;
use Database\Seeders\GovernmentSeeder;
use Database\Seeders\EnvironmentSeeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        User::query()->create([
            'nama' => 'Administrator',
            'email' => 'admin.voters-app@gmail.com',
            'password' => bcrypt('1q2w3e4r5t'),
            'username' => 'admin',
            'role' => 'super',

        ]);

        $this->call([
            EnvironmentSeeder::class,
            GovernmentSeeder::class,
            SocialSeeder::class,
        ]);
    }
}
