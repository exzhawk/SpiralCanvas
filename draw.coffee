SIDE = 3
LENGTH = 30
vertex = []
#c = document.getElementById('canvas')
body = document.body
c = document.createElement 'canvas'
c.setAttribute 'width', body.offsetWidth
c.setAttribute 'height', body.offsetHeight
body.appendChild c
ctx = c.getContext '2d'
width = c.width
height = c.height
x_center = width / 2
y_center = height / 2
#draw the very first polygon
coord =
  x: 0
  y: 0
for i in [0..SIDE - 1]
  init_len = LENGTH * Math.sin(Math.PI / SIDE) * (SIDE - 1)
  coord =
    x: x_center + init_len * Math.cos(i * 2 * Math.PI / SIDE)
    y: y_center + init_len * Math.sin(i * 2 * Math.PI / SIDE)
  vertex.push(coord)
  ctx.lineTo(coord.x, coord.y)
for i in [0..400]
  pass_coord = vertex.shift()
  len = Math.sqrt(Math.pow((pass_coord.x - coord.x), 2) + Math.pow((pass_coord.y - coord.y), 2))
  new_coord =
    x: pass_coord.x + (pass_coord.x - coord.x) * LENGTH / len
    y: pass_coord.y + (pass_coord.y - coord.y) * LENGTH / len
  vertex.push(new_coord)
  coord = new_coord
  ctx.lineTo(coord.x, coord.y)
  ctx.stroke()

