# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

attachRatingHandler = ->
  $(".rating").on "click", ->
    url = $(this).attr("href")
    $.post url, ((response) ->
      if response is "error"
        $("#rating_message").html "<div class='alert alert-danger'><strong>Oh snap!<strong> try submitting again</div>"
      else
        rating = response.value
        rate_div_id = parseInt(response.interval)
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