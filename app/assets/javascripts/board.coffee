# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

canvas = $('draw-area')
ctx = canvas[0].getContext('2d')
ctx.lineWidth = 1

ctx.putPoint = (x, y)-> # x,yに点を描画
  @.beginPath()
  @.arc(x, y, @.lineWidth / 2.0, 0, Math.PI*2, false)
  @.fill()
  @.closePath()
ctx.drawLine = (sx, sy, ex, ey)-> # 始点(sx, sy) から 終点(ex, ey)に線を描画
  @.beginPath()
  @.moveTo(sx, sy)
  @.lineTo(ex, ey)
  @.stroke()
  @.closePath()

mousedown = false
canvas.mousedown (e)->
  ctx.prevPos = getPointPosition(e)
  mousedown = true
  ctx.putPoint(ctx.prevPos.x, ctx.prevPos.y)

canvas.mousemove (e)->
  return unless mousedown
  nowPos = getPointPosition(e)
  ctx.drawLine(ctx.prevPos.x, ctx.prevPos.y, nowPos.x, nowPos.y)
  ctx.putPoint(nowPos.x, nowPos.y)
  ctx.prevPos = nowPos

canvas.mouseup (e)->
  mousedown = false
canvas.mouseout (e)->
  mousedown = false
