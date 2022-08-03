<?php

namespace App\Http\Controllers\EstateOwner;
use App\Http\Util\CommonUtil;
use Illuminate\Http\Request;
use App\RequestType;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use App\ProjectMember;
use App\DesignRequest;
use App\RequestEnginner;

use App\Components\User\Models\User;
use App\Notifications\ProjectCreatedNotification;
use App\Notifications\AcceptedRequestOfficeNotification;
use App\Notifications\RejectedRequestOfficeNotification;
use App\Notifications\AcceptDesignRequestByEstateOwner;
use App\Notifications\RejectDesignRequestByEstateOwner;
use App\Notifications\AskDesignRequestOffer;
use App\Notifications\DesignRequestSendedToEmployees;


use Notification;
use App\Http\Controllers\Controller;
use App\VisitRequest;
use App\DefaultEnginnersRequest;
use Lang;
use App\DesignEnginner;
use App\Http\Responses\Response;
class DesignRequestController extends  Controller
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

        $childrens=$user->childrenIds($user->id);
        array_push($childrens,$user->id);
        
        $requests = DesignRequest::with('stages','customer','offices','project','designEnginners')->whereIn('customer_id', $childrens);

        $requests = $requests->orderBy($sort_by, $orderby)
                    ->paginate($rowsPerPage);

       return $this->respondSuccess($requests);
        
      
    }

    
    public function store(Request $request)
    {
        $validate = validator($request->all(), [
                'customer_id' => 'required',
                'project_id' => 'required',
                'office_id' => 'required',
            ],
            [
                'required'  => 'The :attribute field is required.',
            ]
        );
        if ($validate->fails()) {
            return $this->respondWithError($validate->errors()->first());
        }

        try {

            $design=DesignRequest::where('project_id', $request->project_id)->whereIn('status',['sent','new','accepted','in_progress','sent'])->first();
            if($design != null){
              $message='يوجد هناك تصميم تابع لفس المشروع  بمرحلة العمل';
              return  $this->respondSuccess($message);
            }
            DB::beginTransaction();
            $input = $request->all();
            $input['created_at']=Carbon::now();
            $input['created_by'] = Auth::id();
            $input['status']= $request->sent==0 ? 'new' : 'sent';

            $request = DesignRequest::create($input);
            $request->offices()->attach($input['office_id']);
           
            if($request->sent== 1){
                 $this->_saveAskDesignRequestOfferNotifications($input['office_id'], Auth::id());
            }

            DB::commit();
            return $this->respondSuccess(__('messages.saved_successfully'));
        }

         catch (Exception $e) {
            $output = $this->respondWentWrong($e);
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
                'office_id' => 'required',
            ],
            [
                'required'  => 'The :attribute field is required.',
            ]
        );
        if ($validate->fails()) {
            return $this->respondWithError($validate->errors()->first());
        }

        try {
            $design=DesignRequest::where('project_id', $request->project_id)->whereIn('status',['sent','new','accepted','in_progress','sent'])->first();
            if($design != null){
              return  $this->respondWentWrong('هناك طلب تصميم لنفس المشروع  في مرحلة العمل');
            }
            if($design!=  null){
                DB::beginTransaction();
                $input = $request->all();
                $design->update($input);
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


  

    public function show($id)
    {
        $request = DesignRequest::with('stages','customer','project','office')->findOrFail($id);
        $request = DesignRequest::find($id);
        if($request!=  null){
            return $this->respondSuccess($request);
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

            $request = DesignRequest::find($id);
            if($request!=  null){
                $request->authors()->detach($request->offices);
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




    
    

    public function confirmDesign(Request $request)
    {

        try {
            $design = DesignRequest::find($request->design_id);
            if($design!=  null){
                DB::beginTransaction();
                $design->status='sent';
                $design->sent=1;
                $design->update();
                $this->_saveAskDesignRequestOfferNotifications([$design->office_id], Auth::id());
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

    
    public function acceptDesign(Request $request)
    {

        try {
            $design_enginner = DesignEnginner::find($request->design_enginner_id);

            if($design_enginner!=  null){
                DB::beginTransaction();
                $design=DesignRequest::findOrFail($design_enginner->design_id);
                $design_enginner->is_agreed=$request->status==1?1:0;
                $design_enginner->is_rejected=$request->status==0?1:0;
                $design_enginner->update();
              
              
              
                if($request->status==1){
                      
                    if($design_enginner->order ==1)
                   {
                    $next_design=DesignEnginner::where('design_id',$design_enginner->design_id)->where('order',$design_enginner->order +1)->first();
                    $next_design->is_active=1;
                    $next_design->update();
                    $data=[
                        'stage_id'=>$design_enginner->stage_id,
                        'estate_id'=>Auth::id()
                    ];
                    $this->_saveAcceptDesignRequestByEstateOwnerNotifications([$design_enginner->enginner_id],$data);
                     $data1=[
                         'office_id'=>$design->office_id,
                         'stage_id'=>$next_design->stage_id
                     ];
                    $this->_saveDesignRequestSendedToEmployeesNotifications($next_design->enginner_id,$data1);

                    
                   }

                  
                }
           
                else{
                    $design->status='rejected';
                    $design->update();
                    $data=[
                        'stage_id'=>$design_enginner->stage_id,
                        'estate_id'=>Auth::id()
                    ];
                    $this->_saveRejectDesignRequestByEstateOwnerNotifications([$design_enginner->enginner_id],$data);
                }

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


    
    protected function _saveAskDesignRequestOfferNotifications($members, $estate_id)
    {
        foreach ($members as $member){
            $notifiable_users = User::find($member);
            Notification::send($notifiable_users, new AskDesignRequestOffer($estate_id));
        }
    }

    protected function _saveProjectCreatedNotifications($members, $project_id)
    {
        foreach ($members as $member){
            $notifiable_users = User::find($member);
            Notification::send($notifiable_users, new ProjectCreatedNotification($project_id));
        }
    }

    protected function _saveRejectedRequestNotifications($member, $office_id)
    {
       // foreach ($members as $member){
            $notifiable_users = User::find($member);
            Notification::send($notifiable_users, new RejectedRequestOfficeNotification($office_id));
        //}
    }

    protected function _saveAcceptedRequestNotifications($member, $office_id)
    {
            $notifiable_users = User::find($member);
            Notification::send($notifiable_users, new AcceptedRequestOfficeNotification($office_id));
    }


    protected function _saveAcceptDesignRequestByEstateOwnerNotifications($member,$data)
    {
            $notifiable_users = User::find($member);
            Notification::send($notifiable_users, new AcceptDesignRequestByEstateOwner($data));
    }
    protected function _saveRejectDesignRequestByEstateOwnerNotifications($member,$data)
    {
            $notifiable_users = User::find($member);
            Notification::send($notifiable_users, new RejectDesignRequestByEstateOwner($data));
    }

    protected function _saveDesignRequestSendedToEmployeesNotifications($member, $data)
    {
        //foreach ($members as $member){
            $notifiable_users = User::find($member);
            Notification::send($notifiable_users, new DesignRequestSendedToEmployees($data));
     }
}
