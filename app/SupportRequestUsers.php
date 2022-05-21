<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SupportRequestUsers extends Model
{
    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];
    protected $table ="suport_request_enginnering_office";


 
    public function supporter()
    {
        return $this->belongsTo('App\Components\User\Models\User', 'support_id');
    }

}
