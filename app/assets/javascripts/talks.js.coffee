# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

attachRatingHandler = ->
  $(".rating_slider").slider(reversed: true).on("slide", ->
    updateRating()
    return
  ).on "slideStop", ->
    updateFinalRating()  unless window.app.voted
    return

  initialSetting = ->
    $(".rating_slider").slider "setValue", 1
    $(".val").text 1
    window.app = {}
    window.app.voted = false
    return

  initialSetting()
  updateRating = ->
    unless window.app.voted
      console.log "updating"
      rawRating = $(".rating_slider").slider("getValue")
      $(".val").text rawRating
      window.clearTimeout window.app.id
    return

  updateFinalRating = ->
    window.app.id = window.setTimeout(->
      console.log "starting final update"
      $(".instruction").hide()
      $(".request").show()
      $(".slider").addClass "slider-disabled"
      rating = $(".val").text()
      $.post "/events/1/talks/6/rate?rating=" + rating, ((response) ->
        if response is "error"
          $("#rating_message").html "<div class='alert alert-danger'><strong>Oh snap!<strong> try submitting again</div>"
        else
          rating = response.value
          rate_div_id = parseInt(response.interval)
          $("#rate_" + rate_div_id).removeClass().addClass("bar").addClass(rating_to_class[rating]).html rating_to_message[rating]
        false
      ), "json"
      window.app.voted = true
      return
    , 2000)
    return

  return

$(document).ready attachRatingHandler
$(document).on "page:load", attachRatingHandler