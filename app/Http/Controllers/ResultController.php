<?php

namespace App\Http\Controllers;

use App\Models\Result;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\QuestionResource;

class ResultController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function result()
    {
        $id = session('id');   
        $count_que = Result::where('user_id','=', $id)->whereIn('tage',[1,2])->count();
        if($count_que==10){
            $results['skipAns'] = Result::where('user_id','=', $id)->where('tage',2)->count();
            $results['correctAns'] =  DB::table('result')->join('questions', 'result.question_id', '=', 'questions.id')->where('result.user_id','=', $id)->where('tage',1)->count();
            $results['wrongAns']=10-($results['skipAns']+$results['correctAns']);
            return response()->json(
                [
                    'status'=>'pass',
                    'data'=>$results
                    
                ],
                200);
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function skip(Request $request)
    {
        $id = session('id'); 
        $Result = Result::where("question_id", $request->question_id)->where("user_id",$id)->update(["option_id"=>(int)0,
        "tage"=>(int)2]);       
       
        if($Result){
            return response()->json(
                [
                    'status'=>'pass',
                    'message'=>'Answer the question...',
                    
                ],
                200);
        
        }else{
            
            return response()->json(
                [
                    'status'=>'fail',
                    'message'=>'data not found'
                ],
                401);
    }
       
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
       
        $id = session('id');        
        $Result = Result::where("question_id", $request->question_id)->where("user_id",$id)->update(["option_id"=>(int)$request->option_id,
        "tage"=>(int)1]);
       
        if($Result){
            return response()->json(
                [
                    'status'=>'pass',
                    'message'=>'Answer the question',
                    
                    
                ],
                200);
        
        }else{
            
            return response()->json(
                [
                    'status'=>'fail',
                    'message'=>'data not found'
                ],
                401);
    }

}

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
