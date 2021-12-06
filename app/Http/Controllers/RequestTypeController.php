<?php

namespace App\Http\Controllers;
use App\Http\Util\CommonUtil;
use Illuminate\Http\Request;
use App\RequestType;

class RequestTypeController extends Controller
{

    public function index(Request $request)
    {
        $types=RequestType::select('id', 'name')
                        ->get()
                        ->toArray();

                return $types;
    }


    public function store(Request $request)
    {
        try {
            $type=RequestType::where('name',$request->name)->get();
            if($type->count()>0){
                $data = [ 'message' => 'this name is exist'];
                return $data;
            }else{
                $types=RequestType::create([
                    'name'=>$request->name
                ]);
                
                $types=RequestType::select('id', 'name')
                        ->get()
                        ->toArray();

                return $types;
            }
            

        } catch (Exception $e) {
            $output = $this->respondWentWrong($e);
        }

    }

    public function getPriority(Request $request)
    {
        $priority = [
            [
                'key' => 'low',
                'value' => __('messages.low')
            ],
            [
                'key' => 'medium',
                'value' => __('messages.medium')
            ],
            [
                'key' => 'high',
                'value' => __('messages.high')
            ],
            [
                'key' => 'urgent',
                'value' => __('messages.urgent')
            ]
        ];
        return  $priority;

    }



   
}
