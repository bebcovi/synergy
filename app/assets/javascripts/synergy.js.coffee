#= require jquery
#= require jquery_ujs
#
#= require_self
#
#= require_tree .
#= stub active_admin

jQuery ($) ->

  page = $("body").attr("class").split(" ")

  window.App =
    controller: page[0]
    action:     page[1]
