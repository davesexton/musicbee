# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.play_button').click ->
    data = $(this).data()
    $('#player')[0].load("audios/2.ogg")
    #$('#player')[0].currentSrc = $('#player')[0].currentSrc.replace /\/\d*\./, '/2.'
    alert $('#player')[0].currentSrc
#
