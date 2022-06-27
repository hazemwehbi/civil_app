<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReportType extends Model
{
    use HasFactory;

    protected $fillable=['form','type_name'];
    protected $casts = [
        'type_list_ar' => 'array',
        'type_list_en' =>'array'
    ];
}
