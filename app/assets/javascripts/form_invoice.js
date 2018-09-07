$(document).ready(function(){
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

  $("#invoice_origin_zipcode").focus(function(){
     let cityo=$("#invoice_origin_city").val()
     if (cityo !== "") {
      $.ajax({
      url: "/zipcodes?name="+cityo,
      context: document.body
      })
      .done(function(data) {
        $('#invoice_origin_zipcode').autocomplete({
        data: data,
        });
      
      });
    }
  })

  $("#invoice_destination_zipcode").focus(function(){
     let cityo=$("#invoice_destination_city").val()
      if (cityo !== "") {
      $.ajax({
      url: "/zipcodes?name="+cityo,
      context: document.body
      })
      .done(function(data) {
        $('#invoice_destination_zipcode').autocomplete({
        data: data,
        });
      });
    }
  })

  $('select').formSelect();

});
