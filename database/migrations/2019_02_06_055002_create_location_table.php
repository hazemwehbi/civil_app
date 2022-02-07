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
            $table->enum('province_municipality', ['province1', 'province2', 'province3'])->nullable();
            $table->enum('municipality', ['municipality1', 'municipality2', 'municipality3'])->nullable();

            $table->enum('category', ['category1', 'category2', 'category3'])->nullable();
            $table->enum('neighborhood', ['neighborhood1', 'neighborhood2', 'neighborhood3'])->nullable();
            $table->enum('district', ['district1', 'district2', 'district3'])->nullable();

           // $table->string('municipality')->nullable();;
            $table->string('plan_id')->nullable();;
            $table->string('piece_number')->nullable();;
            $table->unsignedInteger('size_number')->nullable();;
            $table->string('instrument_number')->nullable();;
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
