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
  $(".advantage-show ").hide()
}
function HideClassListItem() {
  $('.collection-item').removeClass("active")
}

function activateClassListItem(currentSlide){
  HideClassListItem() 
  $(".l-"+currentSlide).addClass("active")
}

function filterItem(slideClicked) {
  hideItems()
  $(".i-"+slideClicked).show()
}

function changeItem(slide){
  currentSlide = slide
  activateClassListItem(currentSlide)
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