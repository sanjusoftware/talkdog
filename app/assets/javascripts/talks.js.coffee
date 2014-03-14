# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(".rating").on "click", ->
    url = $(this).attr("href")
    $.post url, (response) ->
      if response is "error"
        $("#rating_message").html "<div class='alert alert-danger'><strong>Oh snap!<strong> try submitting again</div>"
      else
        if response > 0
          $("#rating_message").html "<div class='alert alert-success'><strong>Well done!<strong></strong> It's mesmerizing</div>"
          $("#rating_progress").append "<div class='bar bar-success' style='width: 15%'>Great</div>"
        else if response < 0
          $("#rating_progress").append "<div class='bar bar-danger' style='width: 15%'>WTF</div>"
          $("#rating_message").html "<div class='alert alert-warning'><strong>Oh Crap!</strong> It's getting bored</div>"
        else
          $("#rating_message").html "<div class='alert alert-info'><strong>Poor!</strong> It's not so interesting yet</div>"
          $("#rating_progress").append "<div class='bar bar-warning' style='width: 15%'>Neutral</div>"
      return

    false

  return
