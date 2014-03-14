# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

attachRatingHandler = ->
  rating_to_message =
    5: "Mesmerising"
    4: "Mesmerising"
    3: "Mesmerising"
    2: "Mesmerising"
    1: "Mesmerising"
    "-1": "Boring"
    "-2": "Sad"
    "-3": "Can't Stand"
    "-4": "Crap"
    "-5": "WTF"

  rating_to_class =
    5: "bar-success"
    4: "bar-success"
    3: "bar-success"
    2: "bar-success"
    1: "bar-success"
    "-1": "bar-danger"
    "-2": "bar-danger"
    "-3": "bar-danger"
    "-4": "bar-danger"
    "-5": "bar-danger"

  $(".rating").on "click", ->
    url = $(this).attr("href")
    $.post url, ((response) ->
      if response is "error"
        $("#rating_message").html "<div class='alert alert-danger'><strong>Oh snap!<strong> try submitting again</div>"
      else
        rating = parseInt(response.value)
        rate_div_id = Math.abs(rating)
        $("#rate_"+rate_div_id).removeClass()
        $("#rate_"+rate_div_id).addClass('bar')
        $("#rate_"+rate_div_id).addClass(rating_to_class[rating])
        $("#rate_"+rate_div_id).html(rating_to_message[rating]);

      return
    ), "json"

    false

  return

$(document).ready attachRatingHandler
$(document).on "page:load", attachRatingHandler