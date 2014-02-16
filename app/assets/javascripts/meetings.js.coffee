# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  init()

$(document).on "page:change", ->
  init()

init = ->
  $('.datepicker').datepicker 
    dateFormat: 'mm-dd-yy'
    showButtonPanel: true
  return true
