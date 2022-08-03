<?php

namespace App\Http\Controllers;

use App\Components\User\Models\User;
use App\Http\Resources\UserResource;
use App\Project;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Report;
use App\ReportType;
use Auth;
use Exception;
use Illuminate\Http\File;
class ReportController extends Controller
{
    //

    public function index()
    { 
        $rowsPerPage = (request()->get('rowsPerPage') > 0) ? request()->get('rowsPerPage') : 0;
        $sort_by = request()->get('sort_by');
        $descending = request()->get('descending');
        $project_id = request()->get('project_id');
        if ($descending == 'false') {
            $orderby = 'asc';
        } elseif ($descending == 'true') {
            $orderby = 'desc';
        } elseif ($descending == '') {
            $orderby = 'desc';
            $sort_by = 'id';
        }
        $reports =  Report::with('project','reportCreator','media','project.members','type','project.customer','office')->orderBy($sort_by, $orderby);
        if(Auth::user()->user_type_log=='ENGINEERING_OFFICE_MANAGER') {
            $reports = $reports->where('created_by', Auth::id())
                       ->orWhere('office_id', Auth::id())
                       ->orWhere('office_id', Auth::user()->parent_id);
        }
        $project_note = $reports->paginate($rowsPerPage);
        return $this->respond($project_note);
    }



    public function store(Request $request)
    {
        if(Auth::user()->user_type_log=='ENGINEERING_OFFICE_MANAGER' || Auth::user()->user_type_log=='SITE_MANAGENMENT')
       { try {
            DB::beginTransaction();
            $project_id = $request->input('project_id');
            if(Auth::user()->user_type_log=='ENGINEERING_OFFICE_MANAGER') {
                if(Auth::user()->parent_id==null)
               $office_id = Auth::id();
               else
               $office_id = Auth::user()->parent_id;
            }
            else
            $office_id = $request->input('office_id');
            $report_type = $request->input('type');
           
            $report = Report::create([
                        'project_id' => $project_id,
                        'type_id'=>$report_type,
                        'created_by'=>Auth::id(),
                        'office_id'=> $office_id,
                    ]);
                   // if($request->hasFile('pdfFile'))
                     
                  //   $reportFile = file_put_contents('report'.time().'.pdf', $request->pdfFile);
                     
               $report->addMedia($request->pdfFile)->usingFileName('report'.time().'.pdf')->toMediaCollection('report');
            DB::commit();
            $output = $this->respondSuccess(__('messages.printed_saved_successfully'));
            
        } catch (Exception $e) {
            DB::rollBack();
            $output = $this->respondWentWrong($e);
        }
        return $output;
        }
    }



    public function show($id)
    {
        //echo 'mehyaaaa';
    //    die();
        try {
           // $project_id = request()->get('project_id');
            $report = Report::with('project','reportCreator','media','project.members','type','project.customer','office','office.office','office.office.media')->findOrFail($id);
                              //  ->
//where('notable_id', $project_id)
            $output = $this->respond($report);
        } catch (Exception $e) {
            $output = $this->respondWentWrong($e);
        }
        return $output;
    }




    public function update(Request $request, $id)
    {
        try {
            DB::beginTransaction();

            $data = $request->only('name', 'description');

            $project_id = $request->get('project_id');
            $report = Report::findOrFail($id);
                               

            $report->name = $data['name'];
            $report->description = $data['description'];
            $report->save();

            // //Add medias for project
            // if (!empty($request->medias)) {
            //     $this->addMedias($request->medias, $project_note, 'project_note');
            // }
            DB::commit();

            $output = $this->respondSuccess();
        } catch (Exception $e) {
            DB::rollBack();
            $output = $this->respondWentWrong($e);
        }
        return $output;
    }


       /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $project_id = request()->get('project_id');
            $note = Report::findOrFail($id);
                      
            $note->delete();

            $output = $this->respondSuccess();
        } catch (Exception $e) {
            $output = $this->respondWentWrong($e);
        }
        return $output;
    }

    public function getOffices(Request $request){
        $offices= User::where('user_type_log','ENGINEERING_OFFICE_MANAGER')
        ->WhereHas('projects', function ($q) use ($request) {
                 $q->Where('projects.id', $request->project_id);
             })
        ->orWhereHas('projectCreator', function ($q) use ($request) {
                $q->Where('projects.id', $request->project_id);
            })
       ->get();
        $data = ['offices' => $offices];

        return $data;
    }
    public function getReportTypes(Request $request)
    {
        $types = collect(ReportType::all());
        $types = $types->map(function ($item) {
            if(app()->getLocale() == 'ar')
             $item->type_name = $item->type_name_ar;
            else
             $item->type_name = $item->type_name_en;
             return $item;
        });
        $projects = Project::with('customer', 'categories', 'members', 'members.media','location','creator','report','report.reportCreator','report.type');
        if(Auth::user()->user_type_log=='ENGINEERING_OFFICE_MANAGER') {
            $projects = $projects->where(function($q) {
                $q->where('created_by',Auth::user()->id)
                ->orWhere('created_by',Auth::user()->parent_id)
                ->orWhereHas('members', function ($qu) {
                $qu->where('user_id', Auth::user()->id)
                ->orWhere('user_id',Auth::user()->parent_id);
            }); 
            })->get();
        }
        else
        $projects = $projects->get();
        $offices= UserResource::collection(User::where('user_type_log','ENGINEERING_OFFICE_MANAGER')->get());
        $report_id=Report::latest()->first()?Report::latest()->first()->id+1:1;
        $data = ['offices' => $offices, 'types' => $types, 'projects' => $projects,'report_id'=>$report_id ];

        return $data;

    }




}
