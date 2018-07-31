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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
//= require materialize-sprockets
//= require_tree .


$(document).ready(function(){
		$(".wrapper").on('click', '.flexitem', function (e) {
    // your function here
    	$(".flex-sibling").removeClass("flex-sibling")
    	if ($(this).hasClass( "flex-active" )){
    		$(".flex-active").removeClass("flex-active")


    	}
    	else{
    		$(".flex-active").removeClass("flex-active")
				$(this).addClass("flex-active")
                $(this).next().addClass("flex-sibling")

			}

		});
})