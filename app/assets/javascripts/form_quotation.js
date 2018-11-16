
function updateQuotation(){
  $(".cont-flash-messages").html("")
  $form= $( this ).closest("form")
  data = $form.serialize()
  $.post({
      url: $form.attr('action'),
      data: data      
  }).fail(function(data){      
      data.responseJSON.forEach(function(element){
          $(".cont-flash-messages").append("<div class='alert alert-danger alert-dismissible' style= 'z-index: 1040;'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+element+"</div>")
      })
      $.ajax({
        url: $form.attr('action'),
        headers:{Accept:"text/javascript, application/javascript, application/ecmascript, application/x-ecmascript, */*; q=0.01"}      
      });        
  })
}

function foward($step, $pag){

  // animate the step out
  let data= $("#new_quotation").serialize()      
  $.post({
    url: "/quotation_validation",
    data: data
  }).done(function(data){
    $step=$step
    $pag=$pag
    if (data.status == "ok"){
      animationForward($step,$pag)
    }
    else{      
      $(".cont-flash-messages").html("")        
      if (formIsValid($step,data)){
        animationForward($step,$pag)
      }
    }
  });
}

function formIsValid($step,data){
  valid= true
  i=0;
  for (error in data.errors_messages){
    if($.inArray($step[0],$("#quotation_"+error).parents()) > 0 ){
      valid= false
      element= data.errors[i];
      $(".cont-flash-messages").append("<div class='alert alert-danger alert-dismissible' style= 'z-index: 1040;'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+element+"</div>")
    }
    i++
  }
  return valid
}

function animationForward($step,$pag){
    $step.addClass('animate-out');
  
    // animate the step in
    setTimeout(function(){
        $step.removeClass('animate-out is-showing')
             .next().addClass('animate-in');
        $pag.removeClass('is-active')
              .next().addClass('is-active');
      }, 500);
    
    // after the animation, adjust the classes
    setTimeout(function(){
      $step.next().removeClass('animate-in')
            .addClass('is-showing');
      
    }, 500);
}

function back($step, $pag){

  // animate the step out
  $step.addClass('animate-out');
  
  // animate the step in
  setTimeout(function(){
    $step.removeClass('animate-out is-showing')
         .prev().addClass('animate-in');
    $pag.removeClass('is-active')
          .prev().addClass('is-active');
  }, 500);
  
  // after the animation, adjust the classes
  setTimeout(function(){
    $step.prev().removeClass('animate-in')
          .addClass('is-showing');
    
  }, 500);
}

function validateForm(form){

  $form= $(form)
  var data= $form.serialize()
  $.post({
    url: "/quotation_validation",
    data: data
  }).done(function(data){
    
    if (data.status === "fail"){
      $(".cont-flash-messages").html("")
      data.errors.forEach(function(element){
        $(".cont-flash-messages").append("<div class='alert alert-danger alert-dismissible' style= 'z-index: 1040;'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+element+"</div>")
      })
    }
    else if(data.status === "ok"){
      url = $form.attr('action'); 
      $.ajax({
         type: "POST",
         url: url,
         data: $form.serialize() // serializes the form's elements. 
                 
       });
    }    
  });
}

$(document).ready(function(){

  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
  
  /* initialize the fields*/
  $('.datepicker').datepicker();
  $.ajax({
      url: "/cities",
      context: document.body
    })
    .done(function(data) {
      $('input.autocomplete').autocomplete({
      data: data,
      });
    });

  $("#quotation_origin_zipcode").focus(function(){
     let cityo=$("#quotation_origin_city").val()
     if (cityo !== "") {
      $.ajax({
      url: "/zipcodes?name="+cityo,
      context: document.body
      })
      .done(function(data) {
        $('#quotation_origin_zipcode').autocomplete({
        data: data,
        });
      
      });
    }
  })

  $("#quotation_destination_zipcode").focus(function(){
     let cityo=$("#quotation_destination_city").val()
      if (cityo !== "") {
      $.ajax({
      url: "/zipcodes?name="+cityo,
      context: document.body
      })
      .done(function(data) {
        $('#quotation_destination_zipcode').autocomplete({
        data: data,
        });
      });
    }
  })

  $('.foward').click(function(){
    var $btn = $(this),
    $step = $btn.parents('.modal-body'),
    stepIndex = $step.index()-2,
    $pag = $('.modal-header span').eq(stepIndex);        

    if(stepIndex === 0 || stepIndex === 1 || stepIndex === 2) { 
      foward($step, $pag); 
    }  
  });

  $('.back').click(function(){
    var $btn = $(this),
    $step = $btn.parents('.modal-body'),
    stepIndex = $step.index()-2,
    $pag = $('.modal-header span').eq(stepIndex);

    if(stepIndex === 3 || stepIndex === 1 || stepIndex === 2) { 
      back($step, $pag); 
    }      
  });

  $("#new_quotation").on('keypress', 'input', function(e) {
    if(e.keyCode == 13) {    
      e.preventDefault();
      return false;
    }
  });

  console.log("something")

  $("#new_quotation").submit(function(e){
    e.preventDefault()
    validateForm(this)
    return false;   
  })

  $('select').formSelect();
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
  $("input,select").change(updateQuotation)
  
});
