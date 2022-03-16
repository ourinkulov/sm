<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMalakasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('malakas', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id');
            $table->integer('turi');
            $table->text('mavzu');
            $table->integer('sana');
            $table->integer('kun');
            $table->double('ball');
            $table->string('status');
            $table->string('ilova');
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
        Schema::dropIfExists('malakas');
    }
}
