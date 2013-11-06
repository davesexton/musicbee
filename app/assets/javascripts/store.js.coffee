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
window.requestAnimFrame = ((callback) ->
  window.requestAnimationFrame ||
  window.webkitRequestAnimationFrame ||
  window.mozRequestAnimationFrame ||
  window.oRequestAnimationFrame ||
  window.msRequestAnimationFrame ||
  (callback) ->
     window.setTimeout(callback, 1000 / 60)
)()

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
#  canvas = $('#canvas_header')[0]
#  context = canvas.getContext('2d')
#  canvas_width = canvas.width
#  canvas_height = canvas.height
#
#  class beeObj
#    constructor: (@body_src, @head_src) ->
#      @body.src = '/assets/bee_body.png'
#      @head.src = '/assets/bee_head.png'
#      @shadow.src = '/assets/bee_shadow.png'
#      @head.onload = =>
#        @head_width = @head.width / @head_frame_count
#        @head_height = @head.height
#      @body.onload = =>
#        @body_width = @body.width / @body_frame_count
#        @body_height = @body.height
#      @shadow.onload = =>
#        @shadow_height = @shadow.height
#        @shadow_width = @shadow.width
#
#    body: new Image()
#    head: new Image()
#    shadow: new Image()
#    body_frame_count: 9
#    head_frame_count: 8
#    body_frame: 0
#    head_frame: 0
#    wing_speed: 1
#    acceleration: 0.05
#    speed: 1
#    x: 50
#    y: 0
#    x_target: Math.floor(Math.random() * 350 + 50)
#    draw: (ctx) ->
#      if Math.abs(@x - @x_target) < 10
#        @x_target = Math.floor(Math.random() * 350 + 50)
#      @x += 1 if @x_target > @x
#      @x -= 1 if @x_target < @x
#
#      @y += @speed
#      @speed = -1 if @y > 50
#      @speed = 1 if @y < 1
#
#      @wing_speed -= @acceleration if @speed < 0
#      @wing_speed += @acceleration if @speed > 0
#      @body_frame += @wing_speed
#      @body_frame = 0 if @body_frame > @body_frame_count - 1
#
#      @head_frame += 1 if @head_frame > 1
#      @head_frame = 0 if @head_frame > @head_frame_count - 1
#      @head_frame = 1 if Math.floor(Math.random() * 50 + 1) == 50
#      @head_frame = 2 if Math.floor(Math.random() * 40 + 1) == 40
#      shadow_size = (@y + @body_height)  / canvas_height
#
#      ctx.drawImage(@shadow, @x, canvas_height - @shadow_height, @shadow_width * shadow_size, @shadow_height * shadow_size)
#      ctx.drawImage(@body, Math.floor(@body_frame) * @body_width, 0, @body_width - 2, @body_height, @x, @y, @body_width, @body_height)
#      ctx.drawImage(@head, @head_frame * @head_width, 0, @head_width, @head_height, @x - 49, @y + 20, @head_width, @head_height)
#
#      @head_frame = 0 if @head_frame == 1
#      @head_frame += 1 if @head_frame == 2
#
#  window.bee = new beeObj()
#
#  animate = ->
#    context.clearRect 0, 0, canvas_width, canvas_height
#    bee.draw context
#    setTimeout animate, 33
#    #window.requestAnimFrame( ->
#    #  animate()
#    #)
##  if bee.body.complete
#  animate()
