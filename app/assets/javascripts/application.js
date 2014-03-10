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
    $(".rating").on("click", function () {
        var url = $(this).attr('href');

        $.post(url, function (response) {
            if (response == "success") {
                $("#rating_widget").html("Thank you for your feedback. It will help the speaker to reflect on his talk and adapt in future. You'll be able to rate sections of this talk multiple times during its duration");
            } else {
                $("#rating_widget").html("Sorry, we could not register your feedback this time.");
            }
        });
        return false;
    });
});