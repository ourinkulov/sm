<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDarsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dars', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')
                ->constrained()
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->unsignedBigInteger('subject_id');
            $table->unsignedBigInteger('tipurok_id');
            $table->unsignedBigInteger('statusurok_id');


            $table->foreign('subject_id')
                ->references('id')->on('subjects')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->foreign('tipurok_id')
                ->references('id')->on('tipuroks')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->foreign('statusurok_id')
                ->references('id')->on('statusuroks')
                ->onUpdate('cascade')
                ->onDelete('cascade');


            $table->string('mavzu');
            $table->string('guruh');
            $table->date('sana');
            $table->string('ilova');

            $table->float('ball');
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
        Schema::dropIfExists('dars');
    }
}
