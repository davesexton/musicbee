# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#IE8 fixes
d = document
d.createElement 'header'
d.createElement 'nav'
d.createElement 'hgroup'
d.createElement 'footer'
d.createElement 'section'
d.createElement 'aside'

w = this
window.flash_notice = ->
  if $('#notice div').html() != ""
    $('#notice').animate {
      top: 0
    }, 500, ->
      setTimeout ->
        $('#notice').animate {
          top: -60
        }, 500
      , 3000

$ ->
  flash_notice()
