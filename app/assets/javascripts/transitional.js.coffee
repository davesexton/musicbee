# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  if $('.transitional').length > 0 and $('#player').length > 0
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

$ ->
  if $('#canvas').length > 0
    canvas = $('#canvas')[0]
    context = canvas.getContext('2d')
    canvas_width = canvas.width
    canvas_height = canvas.height

    class beeObj
      constructor: (@body_src, @head_src) ->
        @body.src = '/assets/bee_body.png'
        @head.src = '/assets/bee_head.png'
        @shadow.src = '/assets/bee_shadow.png'
        @head.onload = =>
          @head_width = @head.width / @head_frame_count
          @head_height = @head.height
        @body.onload = =>
          @body_width = @body.width / @body_frame_count
          @body_height = @body.height
        @shadow.onload = =>
          @shadow_height = @shadow.height
          @shadow_width = @shadow.width

      body: new Image()
      head: new Image()
      shadow: new Image()
      body_frame_count: 9
      head_frame_count: 8
      body_frame: 0
      head_frame: 0
      wing_speed: 1
      acceleration: 0.05
      speed: 1
      x: 90
      y: 0
      x_target: Math.floor(Math.random() * 350 + 50)
      draw: (ctx) ->
        #if Math.abs(@x - @x_target) < 10
        #  @x_target = Math.floor(Math.random() * 350 + 50)
        #@x += 1 if @x_target > @x
        #@x -= 1 if @x_target < @x

        @y += @speed
        @speed = -1 if @y > 50
        @speed = 1 if @y < 1

        @wing_speed -= @acceleration if @speed < 0
        @wing_speed += @acceleration if @speed > 0
        @body_frame += @wing_speed
        @body_frame = 0 if @body_frame > @body_frame_count - 1

        @head_frame += 1 if @head_frame > 1
        @head_frame = 0 if @head_frame > @head_frame_count - 1
        @head_frame = 1 if Math.floor(Math.random() * 50 + 1) == 50
        @head_frame = 2 if Math.floor(Math.random() * 40 + 1) == 40
        shadow_size = (@y + @body_height)  / (canvas_height - 250)

        ctx.drawImage(@shadow, @x + 30 , canvas_height - @shadow_height - 160, @shadow_width * shadow_size * 1.75, @shadow_height * shadow_size * 1.75)
        ctx.drawImage(@body, Math.floor(@body_frame) * @body_width, 0, @body_width - 2, @body_height, @x, @y, @body_width * 1.75, @body_height * 1.75)
        ctx.drawImage(@head, @head_frame * @head_width, 0, @head_width, @head_height, @x - 89, @y + 40, @head_width * 1.75, @head_height * 1.75)

        @head_frame = 0 if @head_frame == 1
        @head_frame += 1 if @head_frame == 2

    window.bee = new beeObj()

    animate = ->
      context.clearRect 0, 0, canvas_width, canvas_height
      bee.draw context
      setTimeout animate, 33
    animate()
