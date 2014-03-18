# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

attachTimeHandler = ->
  $(".count_down_timer").TimeCircles
    animation: "ticks"
    bg_width: 0.2
    fg_width: 0.03
    circle_bg_color: "#90989F"
    time:
      Days:
        text: "Days"
        color: "#40484F"
        show: false

      Hours:
        text: "Hours"
        color: "#40484F"
        show: true

      Minutes:
        text: "Minutes"
        color: "#40484F"
        show: true

      Seconds:
        text: "Seconds"
        color: "#40484F"
        show: true

$(document).ready attachTimeHandler
$(document).on "page:load", attachTimeHandler