#= require jquery
#= require jquery_ujs
#= require turbolinks
$ ->
  spans =
    butter: $('#butters'),
    cheese: $('#cheeses'),
    yaourt: $('#yaourts')

  fields =
    butter: $('[data-type="butter"]'),
    cheese: $('[data-type="cheese"]'),
    yaourt: $('[data-type="yaourt"]')

  # Calculates the remaining points for a given
  # type of resource ; neat to see the remaining
  # points live, editinf the weekly shipment.
  remaining_points_for = (type) ->
    span = spans[type]

    total = fields[type].toArray().map (field) ->
      parseInt(field.value || 0)
    .reduce (x, y) ->
      x + y

    value = parseInt(span.data('max')) - total

    span.html(value)

    if value == 0
      span.parent().removeClass('over remaining')
    else if value > 0
      span.parent().removeClass('over')
          .addClass('remaining')
    else
      span.parent().removeClass('remaining')
          .addClass('over')

  remaining_points_for 'butter'
  remaining_points_for 'cheese'
  remaining_points_for 'yaourt'

  $('input[type="number"]').on 'change', ->
    type = $(this).data('type')
    remaining_points_for type
