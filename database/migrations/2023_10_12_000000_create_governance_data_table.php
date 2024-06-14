<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGovernanceDataTable extends Migration
{
    public function up()
    {
        Schema::create('governance_data', function (Blueprint $table) {
            $table->id();
            $table->integer('company_id');
            $table->integer('year');
            $table->decimal('board_independence', 5, 2);
            $table->decimal('executive_compensation', 15, 2);
            $table->boolean('shareholder_rights');
            $table->boolean('business_ethics_policies');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('governance_data');
    }
}
