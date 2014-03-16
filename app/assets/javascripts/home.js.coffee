# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

attachTimeHandler = ->
  $("#DateCountdown").TimeCircles()
  $(".count_down_timer").TimeCircles time:
    Days:
      show: false

    Hours:
      show: false

  $("#PageOpenTimer").TimeCircles()
  updateTime = ->
    date = $("#date").val()
    time = $("#time").val()
    datetime = date + " " + time + ":00"
    $("#DateCountdown").data("date", datetime).TimeCircles().start()
    return

  # Start and stop are methods applied on the public TimeCircles instance
  $(".startTimer").click ->
    $("#CountDownTimer").TimeCircles().start()
    return

  $(".stopTimer").click ->
    $("#CountDownTimer").TimeCircles().stop()
    return

  # Fade in and fade out are examples of how chaining can be done with TimeCircles
  $(".fadeIn").click ->
    $("#PageOpenTimer").fadeIn()
    return

  $(".fadeOut").click ->
    $("#PageOpenTimer").fadeOut()
    return

  return

$(document).ready attachTimeHandler
$(document).on "page:load", attachTimeHandler