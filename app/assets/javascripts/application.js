// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){

  $('#q_username_cont').autocomplete({source: "/ajax/users"}); 

});

$(document).ready(function(){
    $("#q_username_cont").keyup(function() {
        if ($(this).val().length !=0) {
            $(".search-reset").show();
        } else {
            $(".search-reset").hide();
        }
    });
$('#q_username_cont').keydown(function(e){
    if (e.keyCode == 27) {
        $(this).val("");
        $(".search-reset").hide();
    }
});
$(".search-reset").click(function(event) {
    $(".search-reset").hide();
    $(".search-input").val("");
    });
});