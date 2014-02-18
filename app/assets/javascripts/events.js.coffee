$(document).on "page:change", ->
  if $(".large-sidebar").length > 0
    $("#main_window").removeClass "large-8"
    $("#main_window").addClass "large-6"
    $("#sidebar").removeClass "large-4"
    $("#sidebar").addClass "large-6"
  return