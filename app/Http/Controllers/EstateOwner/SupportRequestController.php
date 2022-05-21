<?php

namespace App\Http\Controllers\EstateOwner;
use App\Http\Util\CommonUtil;
use Illuminate\Http\Request;
use App\RequestType;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use App\ProjectMember;
use App\SupportRequest;
use App\SupportRequestUsers;

use App\Components\User\Models\User;
use Notification;
use App\Http\Controllers\Controller;
use App\VisitRequest;
use App\DefaultEnginnersRequest;
use Lang;
use App\DesignEnginner;
use App\Http\Responses\Response;
use App\Notifications\AskSupportRequestOffer;
use App\Notifications\AcceptSupportRequestByEstateOwner;
use App\Notifications\RejectSupportRequestByEstateOwner;
class SupportRequestController extends  Controller
{
    protected $commonUtil;

    public function __construct(CommonUtil $commonUtil)
    {
        $this->CommonUtil = $commonUtil;
    }


    public function index(Request $request)
    {
        $user=User::find(request()->user()->id);
        $rowsPerPage = ($request->get('rowsPerPage') > 0) ? $request->get('rowsPerPage') : 0;
        $sort_by = $request->get('sort_by');
        $descending = $request->get('descending');

        if ($descending == 'false') {
            $orderby = 'asc';
        } elseif ($descending == 'true') {
            $orderby = 'desc';
        } elseif ($descending == '') {
            $orderby = 'desc';
            $sort_by = 'id';
        }

      //  $childrens=$user->childrenIds($user->id);
      //  array_push($childrens,$user->id);
        $requests = SupportRequest::where('type','support')->with('supportRequestUsers','customer','project','supporters')->where('customer_id', $user->id);
       
//'supportRequestUsers'
        $requests = $requests->orderBy($sort_by, $orderby)
                    ->paginate($rowsPerPage);

       return $this->respondSuccess($requests);
        
      
    }

    
    public function store(Request $request)
    {

      
        $validate = validator($request->all(), [
                'customer_id' => 'required',
                'project_id' => 'required',
                'supporters' => 'required',
            ],
            [
                'required'  => 'The :attribute field is required.',
            ]
        );
        if ($validate->fails()) {
            return Response::respondError($validate->errors()->first());
        }

        try {

            foreach($request->supporters as $item){

                $support=SupportRequest::where('project_id', $request->project_id)->whereIn('status',['sent','new','accepted','in_progress'])->whereHas('supporters', function ($q) use ($item) {
                    //  $q->where('user_id', $customer_id);
                      $q->where('support_id',  $item);
                  })->first();
                
                if($support != null){
                    $message=   'تابع لنفس المشروع بمرحلة  العمل ' . User::find($item )->name.  '  يوجد هناك طلب مرسل  لل '    ;
                 //   return  $this->respondWentWrong($message);
                    return Response::respondError($message);
                }
           }   

            DB::beginTransaction();
            $input['project_id'] = $request->project_id;
            $input['customer_id'] = $request->customer_id;
            $input['note'] = $request->note;
            $input['created_at']=Carbon::now();
            $input['created_by'] = Auth::id();
            $input['status']= $request->sent==0 ? 'new' : 'sent';
            $input['sent']= $request->sent;
            $input['type']= 'support';
            
            $support = SupportRequest::create($input);
            //echo  json_encode($request->supporters);
           // die();
            if(isset($request->supporters)){
                $support->supporters()->sync($request->supporters);
            }
           

            if($request->sent== 1){
                $data=[
                    'estate_id'=> Auth::id(),
                    'link'=> 'support_request_support_list'
                ];

                foreach($request->supporters as $item){
                    $this->_saveAskSupportRequestOfferNotifications([$item],$data);
    
                }                  
             }
           

           

           /* foreach($supports as $item){
                $support_user=SupportRequestUsers::where('request_id',$request->id)->where('support_id ',$item)->first();
                if(!isset($support_user)){
                        DB::table('suport_request_enginnering_office')->insert([
                            'request_id '=>$request->id,
                            'support_id '=>$item,
                        ]);
                }
            }*/
          

            DB::commit();
            return Response::respondSuccess(__('messages.saved_successfully'));
           // return $this->respondSuccess(__('messages.saved_successfully'));
        }

         catch (Exception $e) {
            $output = Response::respondError($e);
        }

    }

        /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validate = validator($request->all(), [
            'customer_id' => 'required',
            'project_id' => 'required',
            'supporters' => 'required',
        ],
        [
            'required'  => 'The :attribute field is required.',
        ]
        );
        if ($validate->fails()) {
            return Response::respondError($validate->errors()->first());
        }
        
        try {

            foreach($request->supporters as $item){

                $support=SupportRequest::where('id','!=',$id)->where('project_id', $request->project_id)->whereIn('status',['sent','new','accepted','in_progress','sent'])->whereHas('supporters', function ($q) use ($item) {
                    //  $q->where('user_id', $customer_id);
                      $q->where('support_id',  $item);
                  })->first();
                
                if($support != null){
                    $message=   'تابع لنفس المشروع بمرحلة  العمل ' . User::find($item )->name.  '  يوجد هناك طلب مرسل  لل '    ;
                 //   return  $this->respondWentWrong($message);
                    return Response::respondError($message);
                }
           }  

            $support=SupportRequest::find($id);
            if($support!=  null){
                DB::beginTransaction();
                $input['project_id'] = $request->project_id;
                $input['customer_id'] = $request->customer_id;
                $input['note'] = $request->note;
                $support->update($input);
                if(isset($request->supporters)){
             
                    $support->supporters()->sync($request->supporters);
                }
                DB::commit();
                $message = Lang::get('site.success_update');
                return Response::respondSuccess($message);
            }
            else{
                $message = Lang::get('site.object_not_found');
                return Response::respondError($message);
            }

        }
         catch (Exception $e) {
            $output = Response::respondError($e);
        }



    }


  

    public function show($id)
    {
      //  $requests = SupportRequest::with('supportRequestUsers','customer','project','supporters')->where('customer_id', $user->id);
        $support = SupportRequest::with('supportRequestUsers','customer','project','supporters')->where('id',$id)->first();
        if($support!=  null){
            return $this->respondSuccess($support);
        }
        else{
            $message = Lang::get('site.object_not_found');
            return $this->respondWentWrong($message);
       
        }
       
    }


       /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{

            $request = SupportRequest::find($id);
            if($request!=  null){
                $request->delete();
                return  $this->respondSuccess(__('messages.deleted_successfully'));
            }
            else{
                $message = Lang::get('site.object_not_found');
                return $this->respondWentWrong($message);
            }
         
        }catch(\Exception $e){
           return  $this->respondWentWrong($e);
        }
        return $output;
    }




    
    

    public function confirmSupport(Request $request)
    {    

       
        try {
            $support = SupportRequest::with('supporters')->where('id',$request->id)->first();
            if($support!=  null){
                DB::beginTransaction();
                $support->status='sent';
                $support->sent=1;
                $support->update();

                $data=[
                    'estate_id'=> Auth::id(),
                    'link'=> 'support_request_support_list'
                ];
                foreach($support->supporters as $item){
                   
                    $this->_saveAskSupportRequestOfferNotifications($item['id'], $data);

                }

              //  $this->_saveAskSupportRequestOfferNotifications([$support->office_id], Auth::id());
                DB::commit();
                $message = Lang::get('site.success_update');
                return $this->respondSuccess($message);
            }
            else{
                $message = Lang::get('site.object_not_found');
                return $this->respondWentWrong($message);
            }

        }
         catch (Exception $e) {
            $output = $this->respondWentWrong($e);
        }
    }

    
    public function acceptSupport(Request $request)
    {

        try {
            $support_user = SupportRequestUsers::find($request->support_user_id);

            if($support_user!=  null){
                DB::beginTransaction();
                $support_service=SupportRequest::findOrFail($support_user->request_id);
                $support_user->is_accept=$request->status==1?1:0;
                $support_user->is_rejected=$request->status==0?1:0;
                $support_user->update();
                $data=[
                    'estate_id'=> Auth::id(),
                    'support_service_id'=> $support_user->id,
                    'link'=>'create_report_price_support_service'
                ];
              
              
                if($request->status==1){
                    $support_users = SupportRequestUsers::where('request_id',$support_service->id)->where('id','!=',$request->support_user_id)->where('is_rejected',0)->where('price','!=',null)->get();
                    foreach($support_users as $item){
                        $item->is_accept=0;
                        $item->is_rejected=1;
                        $item->update();
                        $data1=[
                            'estate_id'=> Auth::id(),
                            'support_service_id'=> $item->id,
                            'link'=>'create_report_price_support_service'
                        ];
                        $this->_saveRejectSupportRequestByEstateOwnerNotifications([$item->support_id],$data1);
                    }
                    $support_service->status='accepted';
                    $this->_saveAcceptSupportRequestByEstateOwnerNotifications([$support_user->support_id],$data);
                }
           
                else{
                   
                    $support_user1 = SupportRequestUsers::where('id' ,'!=',$request->support_user_id)->where('request_id',$support_service->id)->where('is_accept', 0)->where('is_rejected', 0)->first();
                    $support_user2 = SupportRequestUsers::where('id' ,'!=',$request->support_user_id)->where('request_id',$support_service->id)->where('is_accept', 1)->first();
                   // $support_service->status='rejected';
                    if(!isset($support_user1)  && !isset($support_user2)) {
                        $support_service->status='rejected';
                    }
                    $this->_saveRejectSupportRequestByEstateOwnerNotifications([$support_user->support_id],$data);

                }
                $support_service->update();
                DB::commit();
                $message = Lang::get('site.success_update');
                return $this->respondSuccess($message);
            }
            else{
                $message = Lang::get('site.object_not_found');
                return $this->respondWentWrong($message);
            }

        }
         catch (Exception $e) {
            $output = $this->respondWentWrong($e);
        }
    }
    protected function _saveAcceptSupportRequestByEstateOwnerNotifications($member,$data)
    {
            $notifiable_users = User::find($member);
            Notification::send($notifiable_users, new AcceptSupportRequestByEstateOwner($data));
    }
    protected function _saveRejectSupportRequestByEstateOwnerNotifications($member,$data)
    {
            $notifiable_users = User::find($member);
            Notification::send($notifiable_users, new RejectSupportRequestByEstateOwner($data));
    }

    protected function _saveAskSupportRequestOfferNotifications($member, $data)
    {
       // foreach ($members as $member){
            $notifiable_users = User::find($member);
            Notification::send($notifiable_users, new AskSupportRequestOffer($data));
        //}
    }


}
