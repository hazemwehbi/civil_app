<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Report;
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

        $project_note = Report::
                           // ->where('notable_type', 'App\Project')
                            with('project')
                            ->orderBy($sort_by, $orderby)
                            ->paginate($rowsPerPage);

        return $this->respond($project_note);
    }



    public function store(Request $request)
    {
        try {
            DB::beginTransaction();

            $name = $request->input('name');
            $description = $request->input('description');
            $project_id = $request->input('project_id');
            $report_type = $request->input('type');
           
            Report::create([
                        'name' => $name,
                        'description'=>$description,
                        'project_id' => $project_id,
                        'type'=>$report_type,
                        //'type' => 'employee',
                    ]);
            DB::commit();
            $output = $this->respondSuccess(__('messages.printed_saved_successfully'));
            
        } catch (Exception $e) {
            DB::rollBack();
            $output = $this->respondWentWrong($e);
        }
        return $output;
    }



    public function show($id)
    {
        //echo 'mehyaaaa';
    //    die();
        try {
           // $project_id = request()->get('project_id');
            $report = Report::findOrFail($id);
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



    public function getReportTypes(Request $request)
    {
        $types = [
            [
                'key' => 'kick_of_project',
                'value' => __('data.kick_of_project')
            ],
            // [
            //     'key' => 'project_location',
            //     'value' => __('data.project_location')
            // ],
            // [
            //     'key' => 'project_customer',
            //     'value' => __('data.project_customer')
            // ],
  
        ];
        return  $types;

    }




}
