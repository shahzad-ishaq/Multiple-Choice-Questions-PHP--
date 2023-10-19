@extends('layout')
@section('content')


<div class="d-flex flex-row justify-content-center align-items-center" style="margin: 75px;">
 
<div class="card text-white bg-info" style="width: auto;">

    <div class="card-body">        
      <div class="form-group">
        <h5 class="text-center" id='que_no'>Question {{$question->question_no}}</h5> 
        <span id="questin_body">{{$question->questionBody->question_text}}</span></br>
        <input type="hidden" id="queId" value="{{$question->questionBody->id}}"/>
        <div id="question_option_div"> <div>    
        @foreach ($question->questionOption as $item)
       
        <input type="radio" id="{{$item->id}}" name="answer" value="{{$item->id}}">
          <label for="{{$item->id}}"><?php echo $item->option_text ?></label><br>
        @endforeach
        </div></div>
          
        
  </div>
  <button href="#" class="btn btn-primary center" id="skip">skip</button>
  <button href="#" class="btn btn-primary center" id="next">Next</button>
      </div>  
</div>
@endsection