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
            $table->string('province_municipality')->nullable();;
            $table->string('municipality')->nullable();;
            $table->unsignedInteger('plan_id')->nullable();;
            $table->unsignedInteger('piece_number')->nullable();;
            $table->unsignedInteger('size_number')->nullable();;
            $table->unsignedInteger('instrument_number')->nullable();;
            $table->dateTime('instrument_date')->nullable();;
            $table->string('northern_border')->nullable();;
            $table->string('eastern_border')->nullable();;
            $table->string('western_border')->nullable();;
            $table->string('southern_border')->nullable();;
            $table->enum('status', ['not_started', 'in_progress', 'on_hold', 'cancelled', 'completed'])->nullable();
            $table->boolean('lon')->nullable();;
            $table->boolean('lat')->nullable();;

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
