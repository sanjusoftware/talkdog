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
//= require twitter/bootstrap
//= require_tree .


$(document).ready(function () {
    $(".rating").on("click", function () {
        var url = $(this).attr('href');

        $.post(url, function (response) {
            if (response == "error") {
                $("#rating_message").html("<div class='alert alert-danger'><strong>Oh snap!<strong> try submitting again</div>");
            }
            else {
                if(response > 0) {
                    $("#rating_message").html("<div class='alert alert-success'><strong>Well done!<strong></strong> It's mesmerizing</div>");
                    $("#rating_progress").append("<div class='bar bar-success' style='width: 15%'>Great</div>");
                }
                else if (response < 0) {
                    $("#rating_progress").append("<div class='bar bar-danger' style='width: 15%'>WTF</div>");
                    $("#rating_message").html("<div class='alert alert-warning'><strong>Oh Crap!</strong> It's getting bored</div>");
                }
                else {
                    $("#rating_message").html("<div class='alert alert-info'><strong>Poor!</strong> It's not so interesting yet</div>");
                    $("#rating_progress").append("<div class='bar bar-warning' style='width: 15%'>Neutral</div>");
                }
            }
        });
        return false;
    });
});