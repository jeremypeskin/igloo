# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', ->
  unitOrProperty($(".event-type-radio:checked"))
  $(".event-type-radio").change ->
    unitOrProperty($(".event-type-radio:checked"))

unitOrProperty = (eventTypeRadio) ->
  if eventTypeRadio.val() == 'Unit'
    $('.property-event').hide()
    $('.unit-event').show()
  else if eventTypeRadio.val() == 'Property'
    $('.unit-event').hide()
    $('.property-event').show()
