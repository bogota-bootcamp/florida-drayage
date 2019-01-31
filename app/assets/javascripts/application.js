// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require best_in_place
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
//= require cable
//= require channels/chat
//= require materialize

var currentSlide = 1 

$(document).ready(function(){
    var myIndex = 0;
    carousel1();    
    function carousel1() {
        var i;
        var x = document.getElementsByClassName("mySlides");
        for (i = 0; i < x.length; i++) {
          x[i].style.display = "none";  
        }
        myIndex++;
        if (myIndex > x.length) {myIndex = 1}    
        x[myIndex-1].style.display = "block";  
        setTimeout(carousel1, 5000); // Change image every 2 seconds
    }

    $('.collection-item').on('click', changeItem(currentSlide));
})

function hideItems(){
  $(".collection-item").hide()
}

function filterItem(slideClicked) {
  if ( slideClicked == 1){
    hideItems()
    $(".i-1").show()
  } else if ( slideClicked == 2){
    hideItems()
    $(".i-2").show()
  }  else if ( slideClicked == 3){
    hideItems()
    $(".i-3").show()
  } else if ( slideClicked == 4){
    hideItems()
    $(".i-4").show()
  } else if ( slideClicked == 5){
    hideItems()
    $(".i-5").show()
  } else if ( slideClicked == 6){
    hideItems()
    $(".i-6").show()
  } else if ( slideClicked == 7){
    hideItems()
    $(".i-7").show()
  } else if ( slideClicked == 8){
    hideItems()
    $(".i-8").show()
  }
  else {
    hideItems()
    $(".i-1").show()
  }
}

function changeItem(slide){
  currentSlide = slide
  filterItem(currentSlide)
}


function indexUserInitialize(){
  setInterval(function(){
    i=$("div.advantage-menu ul li").index($('.active'))
    i = (i+1)% ($("div.advantage-menu ul li").length)
    $("div.advantage-menu ul li.active").removeClass("active")
    $($("div.advantage-menu ul li")[i]).addClass("active")

    $(".advantage-show.active").removeClass("active")
    $($(".advantage-show")[i]).addClass("active")

  },8000)      

}