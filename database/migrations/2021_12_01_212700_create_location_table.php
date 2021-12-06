<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLocationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('locations', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('project_id');
            $table->foreign('project_id')
                ->references('id')->on('projects')
                ->onDelete('cascade');

            $table->string('province_municipality');
            $table->string('municipality');
            $table->unsignedInteger('plan_id');
            $table->unsignedInteger('piece_number');
            $table->unsignedInteger('size_number');
            $table->unsignedInteger('instrument_number');
            $table->dateTime('instrument_date');
            $table->string('northern_border');
            $table->string('eastern_border');
            $table->string('western_border');
            $table->string('southern_border');
            $table->enum('status', ['not_started', 'in_progress', 'on_hold', 'cancelled', 'completed']);
            $table->boolean('lon');
            $table->boolean('lat');

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
        Schema::dropIfExists('locations');
    }
}
