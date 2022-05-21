<?php

namespace App\Http\Controllers\SupportService;
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
use App\Notifications\ShowSupportRequestOffer;
use App\Http\Controllers\Controller;
use App\VisitRequest;
use App\DefaultEnginnersRequest;
use Lang;
use App\DesignEnginner;
use App\Http\Responses\Response;
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
        $requests = SupportRequest::where('type','support')->with('customer','project','supportRequestUsers','supporters')->where('status','!=','new')->whereHas('supporters', function ($q) use ($user) {
            //  $q->where('user_id', $customer_id);
              $q->where('support_id', $user->id);
          });
          //->where('customer_id', $user->id);
       
//'supportRequestUsers'
        $requests = $requests->orderBy($sort_by, $orderby)
                    ->paginate($rowsPerPage);

       return $this->respondSuccess($requests);
        
      
    }

   public function  showSupportServiceDetails(Request $request){
    try {

        $support_user = SupportRequestUsers::with('supporter')->where('id',$request->support_service_id)->first();
        if($support_user!=  null){
            return $this->respondSuccess($support_user);
        }
        else{
            $message = Lang::get('site.object_not_found');
            return $this->respondWentWrong($message);
        }

    }
     catch (Exception $e) {
        $output = $this->respondWentWrong($e);
        return $output ;
    }

   }
   




   public function sendSupportServiceOffer(Request $request)
   {

       try {
           
           $support_service_user = SupportRequestUsers::findOrFail($request->support_service_id);
           $support_service=SupportRequest::find($support_service_user->request_id );
           //check if already accepted
           $support_service_already = SupportRequestUsers::where( 'id' , '!=',$request->support_service_id)->where('request_id',$support_service_user->request_id)->where('is_accept',1)->first();
            if($support_service_already != null){
                $message = Lang::get('site.already_accepted_another_request',[],'ar');
                return Response::respondError($message);
            }
           if($support_service!=  null){
               DB::beginTransaction();
               $support_service_user->price =$request->price;
               $support_service_user->is_sent=1;
               $support_service_user->update();
               
             //  $project =Project::find($support_service->project_id);
               //send notifiaction
                 $data=[
                     'supporter_id'=>$support_service_user->support_id,
                     'request_id'=>$support_service->id,
                     'project_id'=>$support_service->project_id,
                     'support_user_id'=>$support_service_user->id,
                     'link'=>'show_support_request_price_estate_owner'
                 ];
                 $this->_saveShowSupportRequestOfferNotifications($support_service->customer_id,$data);
                 if($support_service->status == 'sent'){
                    $support_service->status='in_progress';
                    $support_service->update();
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
           $output = $this->respondWentWrong($e);
           return Response::respondError($output);
        
       }
   }



   protected function _saveShowSupportRequestOfferNotifications($member, $data)
   {
       //foreach ($members as $member){
           $notifiable_users = User::find($member);
           Notification::send($notifiable_users, new ShowSupportRequestOffer($data));
     //  }
   }

}
