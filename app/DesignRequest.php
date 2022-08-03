<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
// this model for choose the type of the request
class DesignRequest extends Model
{
    protected $guarded = ['id'];

    //protected $fillable= ['name'];
    protected $table ="design_request";
    
    public function customer()
    {
        return $this->belongsTo('App\Components\User\Models\User','customer_id');
    }

    public function offices()
    {
        return $this->belongsToMany('App\Components\User\Models\User','design_request_office','design_request_id','office_id');
    }

    public function project()
    {
        return $this->belongsTo('App\Project');
    }
///////////// stages of design ////////////////
    public function stages()
    {
        return $this->belongsToMany('App\StageProject', 'stages_project_design_request', 'design_id', 'stage_id' );
    }

    public function designEnginners()
    {
        return $this->hasMany('App\DesignEnginner','design_id');
    }
    public function enginners()
    {
        return $this->belongsToMany('App\Components\User\Models\User', 'stages_project_design_request', 'design_id', 'enginner_id');
    }
}
