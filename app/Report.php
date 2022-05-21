<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Report extends Model
{
   protected $guarded = ['id'];

    public function project()
    {
        return $this->belongsTo('App\Project');
    }

   /**
     * Return the creator of task.
     */
    public function reportCreator()
    {
        return $this->belongsTo('App\Components\User\Models\User', 'created_by');
    }
    
}
