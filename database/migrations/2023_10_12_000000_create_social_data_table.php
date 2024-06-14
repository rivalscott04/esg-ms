<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSocialDataTable extends Migration
{
    public function up()
    {
        Schema::create('social_data', function (Blueprint $table) {
            $table->id();
            $table->integer('company_id');
            $table->integer('year');
            $table->decimal('workforce_diversity', 5, 2);
            $table->decimal('employee_training_hours', 10, 2);
            $table->integer('safety_incidents');
            $table->decimal('community_investment', 15, 2);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('social_data');
    }
}
