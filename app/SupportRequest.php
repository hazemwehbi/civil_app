<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SupportRequest extends Model
{
    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];
    protected $table ="suport_office_request";




    public function customer()
    {
        return $this->belongsTo('App\Components\User\Models\User','customer_id');
    }

  

    public function project()
    {
        return $this->belongsTo('App\Project');
    }

    public function supportRequestUsers()
    {
        return $this->hasMany('App\SupportRequestUsers','request_id');
    }


    public function supporters()
    {
        return $this->belongsToMany('App\Components\User\Models\User', 'suport_request_enginnering_office', 'request_id', 'support_id');
    }




}
