<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLikecommentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('likecomments', function (Blueprint $table) {
            $table->id();
            $table->integer('comment_id')->unsigned();
            $table->integer('user_id')->unsigned();
            $table->boolean('like')->default(0);
            $table->boolean('dislike')->default(0);
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
        Schema::dropIfExists('likecomments');
    }
}
