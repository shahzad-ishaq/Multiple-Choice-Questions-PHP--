<?php

namespace App\Http\Controllers;

use App\Models\Result;
use App\Models\Questions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\QuestionResource;

class QuestionsController extends Controller
{
 

    /**
     * Display the specified resource.
     */
    public function show(Questions $questions)
    {
        $id = session('id');      
        $Result = Result::where('user_id','=', $id)->where('tage','=', 0)->first();
        $Results=QuestionResource::make($Result);
        $count_que = Result::where('user_id','=', $id)->whereIn('tage',[1,2])->count();
        
        if($count_que<10){
        $Results['queNo']=$count_que;
        if($Result){
            return response()->json(
                [
                    'status'=>'pass',
                    'message'=>'Answer the question...',
                    'data'=>$Results
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
    }else{
        return response()->json(
            [
                'status'=>'pass',
                'message'=>'complete the Test'
            ],
            201);
        
       
           
    }
}

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Questions $questions)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
       
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Questions $questions)
    {
        //
    }
}
