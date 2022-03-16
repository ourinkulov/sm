<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLoyihasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('loyihas', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id');
            $table->integer('miqyosi');
            $table->text('mavzu');
            $table->string('raqami',25);
            $table->date('bsana');
            $table->date('ysana');
            $table->string('buyruq',50);
            $table->double('ball')->nullable();
            $table->string('ilova',255);
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
        Schema::dropIfExists('loyihas');
    }
}
