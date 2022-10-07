<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEducationcredentialsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('educationcredentials', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id')->unsigned();
            $table->string('school')->nullable();
            $table->string('primary_major')->nullable();
            $table->string('secondary_major')->nullable();
            $table->string('degree_type')->nullable();
            $table->string('graduation_year')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('educationcredentials');
    }
}
