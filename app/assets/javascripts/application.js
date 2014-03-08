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
//= require bootstrap-datetimepicker.min
//= require_tree .

$(document).ready(function () {
    $('.datetime_field').datetimepicker({
        format: "dd MM yyyy - HH:ii P",
        autoclose: true,
        todayBtn: true,
        startDate: "2013-02-14 10:00",
        todayHighlight: 1,
        minuteStep: 10,
        showMeridian: true
    });
});
