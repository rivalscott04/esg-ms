<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users_profile', function (Blueprint $table) {
            $table->uuid("id")->primary()->default(DB::raw("(UUID())"));
            $table->foreignUuid('user_id')->constrained("users")->cascadeOnDelete();
            $table->string('alamat')->nullable();
            $table->string("no_telp", 15)->nullable();
            $table->text("bio")->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users_profile');
    }
};
