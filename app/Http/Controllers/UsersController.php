<?php

namespace App\Http\Controllers;

use App\Models\Users;
use App\Models\Result;
use App\Models\Questions;
use Illuminate\Http\Request;
use App\Models\QuestionAnswer;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use App\Http\Resources\QuestionResource;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        ////Session::flush();
        $email = session('user');
        $id = session('id');        
        $results=Users::where('email','=', $email)->first();
        
        if($id){
           $questions = Result::where('user_id','=', $id)->where('tage','=', 0)->first();
           $question=QuestionResource::make($questions);
          
           if($questions){
            return view('question' ,compact('question'));
           }else{
            $results['skipAns'] = Result::where('user_id','=', $id)->where('tage',2)->count();
            $results['correctAns'] =  DB::table('result')->join('questionanswer', 'result.option_id', '=', 'questionanswer.right_opton_id')->where('result.user_id','=', $id)->where('tage',1)->count();
            $results['wrongAns']=10-($results['skipAns']+$results['correctAns']);
            return view('result' ,compact('results'));
        }    
    }
        return view('index');
    }

   
    public function store(Request $request)
    {
        $request->validate([
            'email' => 'required',
        ]);

        $userExit = Users::where('email',$request->email)->first();
       if($userExit){
        return response()->json(
            [
                'status'=>'fail',
                'message'=>'Email Already Exit'
            ],
            401);
    }else{
        $user = Users::create($request->all());
         $request->session()->put('user',$user->email); 
         $request->session()->put('id',$user->id); 
         $que=Questions::inRandomOrder()->take(10)->get(); 
       
         $ques = array();;
         foreach($que as $question){
            $ques['user_id'] = $user->id; 
            $ques['question_id'] = $question->id;
            $ques['option_id'] = 0;
            $ques['tage'] = 0;
            Result::create($ques);

         }
        return response()->json(
            [
                'status'=>'pass',
                'message'=>'User Created Successfully',
                'data'=>$user,
            ],
            200);
    }
    }
    /**
     * Display the specified resource.
     */
    
}
