# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.onload = ->
  $("#btn_save").hide()
  $(".amount").bind('input propertychange', ->
    $("#btn_save").show()
    $("#btn_save_dis").hide()
  )
