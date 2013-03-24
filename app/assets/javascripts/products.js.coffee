# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  if $('.products').length > 0
    $('#player')[0].controls = false
    $('#player').bind('ended', ->
      $('.play_button').data('playing', 'n')
      $('.play_button img').each ->
        this.src = this.src.replace /-pause\./, '-play.'
    )

    $('.play_button').click ->

      $('.play_button img').each ->
        this.src = this.src.replace /-pause\./, '-play.'

      $('.play_button').not(this).data('playing', 'n')

      data = $(this).data()
      player = $('#player')[0]
      t = $(this).children('img')[0]

      if data.playing == 'y'
        player.pause()
        t.src = t.src.replace /-pause\./, '-play.'
        $(this).data 'playing', 'n'

      else
        if player.canPlayType("audio/ogg")
          file = data.ogg
        else
          file = data.mp3

        t.src = t.src.replace /-play\./, '-pause.'
        $(this).data 'playing', 'y'

        if player.src.indexOf(file) > -1
          player.play()
        else
          player.src = file
          player.autoplay = true
          player.load()

#
