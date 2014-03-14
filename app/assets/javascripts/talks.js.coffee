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
        $("#rating_progress").removeClass('hide')
        if response == '5'
          $("#rating_progress").append "<div class='bar bar-success' style='width: 15%'>Mesmerizing</div>"
        else if response == '4'
          $("#rating_progress").append "<div class='bar bar-success' style='width: 15%'>Awesome</div>"
        else if response == '3'
          $("#rating_progress").append "<div class='bar bar-success' style='width: 15%'>V Good</div>"
        else if response == '2'
          $("#rating_progress").append "<div class='bar bar-success' style='width: 15%'>Good</div>"
        else if response == '1'
          $("#rating_progress").append "<div class='bar bar-success' style='width: 15%'>Ok Types</div>"
        else if response == '-1'
          $("#rating_progress").append "<div class='bar bar-danger' style='width: 15%'>Oh Crap!</div>"
        else if response == '-2'
          $("#rating_progress").append "<div class='bar bar-danger' style='width: 15%'>Oh Crap!</div>"
        else if response == '-3'
          $("#rating_progress").append "<div class='bar bar-danger' style='width: 15%'>Oh Crap!</div>"
        else if response == '-4'
          $("#rating_progress").append "<div class='bar bar-danger' style='width: 15%'>Oh Crap!</div>"
        else if response == '-5'
          $("#rating_progress").append "<div class='bar bar-danger' style='width: 15%'>Oh Crap!</div>"
      return

    false

  return
