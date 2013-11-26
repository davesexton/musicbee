# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  if $('.orders').length > 0
    updateTotals = ->
      net_total = 0
      vat_total = 0
      gross_total = 0
      $('select').each ->
        td = $(@).closest('td')
        qty = $(@).find('option:selected').text()
        price = td.data('price')
        vat = td.data('vat')
        tot = ((price + vat) * qty).toFixed(2)
        net_total += qty * price
        vat_total += qty * vat
        gross_total += (price + vat) * qty
        td.next('td').text("£#{tot}")
      $('#net_total').text("£#{net_total.toFixed(2)}")
      $('#vat_total').text("£#{vat_total.toFixed(2)}")
      $('#gross_total').text("£#{gross_total.toFixed(2)}")

    updateTotals()

    $('select').change ->
      updateTotals()
      #alert $(@).find('option:selected').text()
