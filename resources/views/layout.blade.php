<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <title>Question</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
     crossorigin="anonymous">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>

<div class="container">
  <!-- Content here -->
  @yield('content')
</div>

</body>
<script>

    $("#login").click(function(){
      var email = $("#email").val();
  $.ajax({
    type: "POST",
    url: "user",
    data:{email:email},
    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
    cache: false,
    success: function(data, textStatus, xhr){
      if(xhr.status==200){
      window.location.href = "/";
      }
      
      },
      error: function(data, textStatus, xhr){
        alert('Email All ready Take a Test')
    }
  });
  });
  $("#next").click(function(){
  var answer_id = $('input[name="answer"]:checked').val(); 
  if(answer_id){
  var questionId = $('#queId').val(); 
  $.ajax({
    type: "POST",
    url: "result_submit",
    data:{option_id:answer_id,question_id:questionId},
    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
    cache: false,
    success: function(data, textStatus, xhr){
      if(xhr.status==200){
        var result = JSON.parse(JSON.stringify(data));
       console.log(result.data);
       next_question();

      }
    }
  });
}else{
  alert("Please Select any Option.")
}
  });

  $("#skip").click(function(){
    var questionId = $('#queId').val(); 
  $.ajax({
    type: "POST",
    url: "skip_question",
    data:{question_id:questionId},
    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
    cache: false,
   
    success: function(data, textStatus, xhr){
      console.log(xhr.status);
      if(xhr.status==200){
        var result = JSON.parse(JSON.stringify(data));
       console.log(result.data)
       next_question();

      }
     
    }
  });
  });

  function next_question(){
    $.ajax({
    type: "POST",
    url: "next_question",
    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
    cache: false,
    success: function(data, textStatus, xhr){
      console.log(xhr.status);
      if(xhr.status==200){
        var result = JSON.parse(JSON.stringify(data));
       console.log(result.data)
       let question = result.data.question_text;
       let qNo=result.data.question_no++;
       $('#que_no').text('Question '+result.data.question_no);
       $('#queId').val(result.data.question_id);
       $("#questin_body").html(question);
       let questionOption = result.data.questionOption;
       let option_body='<div>';
       questionOption.forEach(function (item, index) {
          console.log(item);
          let opt_text = item.option_text;

          option_body +='<input type="radio" id="'+item['id']+'" name="answer" value="'+item.id+'"><label for="'+item.id+'"><span> ';

            option_body +=""+ opt_text.toString() +"";

            option_body +=' <span></label><br>';
           
        });
        option_body +='<div>';
        console.log(option_body);
       $('#question_option_div').html(option_body); 

      }else if(xhr.status==201){
        window.location.href = "/";
      }
     
    }
  });
  }
  function result(){
    $.ajax({
    type: "POST",
    url: "result",
    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
    cache: false,
    success: function(data, textStatus, xhr){
      console.log(xhr.status);
      if(xhr.status==200){
        var result = JSON.parse(JSON.stringify(data));
       console.log(result.data);       
       $('#que_no').text('');
       $('#queId').val('');
       $("#questin_body").html('Result');
      
       $('#question_option_div').html(''); 

      }
     
    }
  });
  }

  </script>
</html>