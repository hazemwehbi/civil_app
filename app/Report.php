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
    public function type()
    {
        return $this->belongsTo('App\ReportType');
    }

   /**
     * Return the creator of task.
     */
    public function reportCreator()
    {
        return $this->belongsTo('App\Components\User\Models\User', 'created_by');
    }
    public function office()
    {
        return $this->belongsTo('App\Components\User\Models\User', 'office_id');
    }
}
