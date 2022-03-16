<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIlmprofilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ilmprofiles', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id');
            $table->string('ilmd');
            $table->string('ilmdi');
            $table->string('iu');
            $table->string('iui');
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
        Schema::dropIfExists('ilmprofiles');
    }
}
