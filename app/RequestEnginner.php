<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RequestEnginner extends Model
{
    //

    public function employee()
    {
        return $this->belongsTo('App\Components\User\Models\User','user_id');
    }
}
