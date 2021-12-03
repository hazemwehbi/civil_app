<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProjectsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('projects', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->nullable();

            $table->unsignedInteger('customer_id')->nullable();
            $table->foreign('customer_id')
                ->references('id')->on('users')
                ->onDelete('cascade');

            $table->enum('billing_type', ['fixed_rate', 'project_hours', 'task_hours'])->default('fixed_rate');
            $table->decimal('total_rate', 8, 2)->default(0);
            $table->decimal('price_per_hours', 8, 2)->default(0);
            $table->decimal('estimated_hours', 8, 2)->default(0);
            $table->decimal('estimated_cost', 8, 2)->default(0);
            $table->enum('status', ['not_started', 'in_progress', 'on_hold', 'cancelled', 'completed'])->nullable();
            
            $table->unsignedInteger('authorization_request_number')->nullable();;            
            $table->unsignedInteger('license_number')->nullable();;
            $table->unsignedInteger('plot_number')->nullable();;
            $table->unsignedInteger('cadastral_decision_number')->nullable();;

            $table->integer('lead_id')->nullable();
            $table->dateTime('start_date')->nullable();
            $table->dateTime('end_date')->nullable();
            $table->text('description')->nullable();
            $table->integer('created_by')->index();
            $table->boolean('favorite')->default(0);


            $table->enum('buiding_type', ['not_started', 'in_progress', 'on_hold', 'cancelled', 'completed'])->nullable();;
            $table->unsignedInteger('role_number')->nullable();
            $table->unsignedInteger('unit_number')->nullable();
            $table->unsignedInteger('using')->nullable();
            $table->decimal('build_rate', 8, 2)->default(0);
           

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
        Schema::dropIfExists('projects');
    }
}
