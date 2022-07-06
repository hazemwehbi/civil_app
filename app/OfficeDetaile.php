<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\HasMedia;
use Spatie\Activitylog\LogOptions;

class OfficeDetaile extends Model implements HasMedia
{
    use HasFactory, InteractsWithMedia;
       public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults();
    }
}
