<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VisitRequest extends Model
{
    protected $guarded = ['id'];

    public function customer()
    {
        return $this->belongsTo('App\Components\User\Models\User');
    }

    public function project()
    {
        return $this->belongsTo('App\Project');
    }


       /**
     * The member that belong to the project.
     */
    public function defaultEnginners()
    {
        return $this->belongsToMany('App\Components\User\Models\User', 'default_enginners_requests',);
    }
}
