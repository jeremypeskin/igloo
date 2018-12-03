# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', ->
  unitOrProperty($("input:radio[name='recurring_event[event_type]']:checked"))
  $("input:radio[name='recurring_event[event_type]']").change ->
    unitOrProperty($("input:radio[name='recurring_event[event_type]']:checked"))

unitOrProperty = (eventTypeRadio) ->
  console.log eventTypeRadio.val()
  if eventTypeRadio.val() == 'Unit'
    $('.property-event').hide()
    $('.unit-event').show()
  else if eventTypeRadio.val() == 'Property'
    $('.unit-event').hide()
    $('.property-event').show()
