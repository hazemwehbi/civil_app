<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    //
    protected $guarded = ['id'];

    public function user(){
        return $this->belongsTo('App\Components\User\Models\User','user_id');
    }
    
}
