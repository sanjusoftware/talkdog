# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

attachRatingHandler = ->
  $(".rating_slider").slider(
    reversed: true
    min: -5
    max: 5
    step: 1
    orientation: "vertical"
    selection: "after"
    tooltip: "show"
  ).on("slide", ->
    updateRating()
    return
  ).on "slideStop", ->
    updateFinalRating()  unless window.app.voted
    return

  initialSetting = ->
    $(".rating_slider").slider "setValue", 0
    window.app = {}
    window.app.voted = false
    return

  initialSetting()
  updateRating = ->
    unless window.app.voted
      console.log "updating"
      rating = $(".rating_slider").slider("getValue")
      $(".slider-handle").removeClass(rating_classes.join(' ')).addClass(rating_to_class[rating])
      window.clearTimeout window.app.id
    return

  updateFinalRating = ->
    window.app.id = window.setTimeout(->
      console.log "starting final update"
      $(".instruction").hide()
      $(".request").show()
      rating = $(".rating_slider").slider("getValue")
      rating_url = $("#url").attr("href")
      $.post rating_url,
        rating: rating
      , ((response) ->
          if response is "error"
            $("#rating_message").html "<div class='alert alert-danger'><strong>Oh snap!<strong> try submitting again</div>"
          else
            rating = response.value
            rate_div_id = parseInt(response.interval)
            $("#rate_" + rate_div_id).removeClass().addClass("bar").addClass(rating_to_class[rating]).html rating_to_message[rating]
          false
        ), "json"
      return
    , 2000)
    return

  return

$(document).ready attachRatingHandler
$(document).on "page:load", attachRatingHandler