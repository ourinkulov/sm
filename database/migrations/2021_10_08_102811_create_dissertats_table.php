<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDissertatsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dissertats', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id');
            $table->string('mavzu','255');
            $table->string('maqomi',50);
            $table->string('shifr',25);
            $table->string('nomi',255);
            $table->string('fan',50);
            $table->date('tsana');
            $table->date('ysana')->nullable();
            $table->string('dalolatnoma',255)->nullable();
            $table->double('ball')->nullable();
            $table->string('status')->nullable();
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
        Schema::dropIfExists('dissertats');
    }
}
