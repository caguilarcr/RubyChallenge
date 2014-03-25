# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#next_step").hide()
  $("#form_id").on("ajax:success", (e, data, status, xhr) ->
    $("#error").html ''
    $("#Result").html xhr.responseText
    $("#next_step").show()
    return
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#error").html xhr.responseText
    $("#next_step").hide()
    return

  return