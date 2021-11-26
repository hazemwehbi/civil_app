<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VisitRequest extends Model
{
    protected $guarded = ['id'];

    public function customer()
    {
        return $this->belongsTo('App\Customer');
    }

    public function project()
    {
        return $this->belongsTo('App\Project');
    }
}
