<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMaqolasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('maqolas', function (Blueprint $table) {
            $table->id();
            $table->integer('turi');
            $table->string('mavzu',255);
            $table->integer('mualliflik');
            $table->integer('miqyosi');
            $table->string('ilova',255);
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
        Schema::dropIfExists('maqolas');
    }
}
