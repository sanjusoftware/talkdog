// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function () {
    alert("bla nbla");

    $(".rating").on("click", function () {
        var url = $(this).attr('href');
        alert(url);
//        var program_id = $("#student_program_id").find("option:selected").val();
//        $.post(url, { registration_pin: 'registration_pin', program_id: 'program_id' }, function (valid_pin) {
//            if (valid_pin == "true") {
//                $("#application_form").show();
//                $("#registration_pin_section").hide();
//            } else {
//                $("#application_form").hide();
//            }
//        });
        return false;
    });
});