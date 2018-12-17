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
