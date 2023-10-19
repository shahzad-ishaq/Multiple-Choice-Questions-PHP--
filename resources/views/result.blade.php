@extends('layout')
@section('content')


<div class="d-flex flex-row justify-content-center align-items-center" style="margin: 75px;">
 
<div class="card text-white bg-info" style="width: 35%;">

    <div class="card-body">        
      <div class="form-group">
        <h5 class="text-center" id='que_no'> Result </h5> 
        
        <p>Correct Ans = <span id="correct_ans">{{$results->correctAns}}</span></p></br>
        <p>Wrong Question = <span id="worng_ans">{{$results->wrongAns}}</span></p></br>
        <p>Skip Question = <span id="skip_ans">{{$results->skipAns}}</span></p></br>
        
        
          
        
  </div>
  
      </div>  
</div>
@endsection