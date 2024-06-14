<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEnvironmentalDataTable extends Migration
{
    public function up()
    {
        Schema::create('environmental_data', function (Blueprint $table) {
            $table->id();
            $table->integer('company_id');
            $table->integer('year');
            $table->decimal('carbon_emissions', 10, 2);
            $table->decimal('energy_consumption', 10, 2);
            $table->decimal('water_usage', 10, 2);
            $table->decimal('waste_recycled', 5, 2);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('environmental_data');
    }
}
