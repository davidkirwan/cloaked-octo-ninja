// prevent browser-based scrolling
document.ontouchmove = function(e){ e.preventDefault() }


// singleton object to contain app
var app = {}


app.init = function() {
  console.log('start init')

  // private 

  var canvas  = document.getElementById('main')
  var canvastop  = canvas.offsetTop
  var canvasleft = canvas.offsetLeft

  var context = canvas.getContext("2d")

  var lastx
  var lasty
  var drawing

  context.strokeStyle = "#000000"
  context.lineCap = 'round'

  context.lineJoin = 'round'
  context.lineWidth = 5


  // detect touch interface
  var hastouch = 'ontouchstart' in document


  // enable desktop browser testing
  var eventnames = {
    touchstart: hastouch ? 'ontouchstart' : 'onmousedown',
    touchmove:  hastouch ? 'ontouchmove'  : 'onmousemove',
    touchend:   hastouch ? 'ontouchend'   : 'onmouseup',
  }

  function clientpos(axis) {
    return function(event) {
      return ( hastouch ? event.touches[0] : event )['client'+axis]
    }
  }
  var clientX = clientpos('X')
  var clientY = clientpos('Y')



  // public

  app.clear = function() {
    context.fillStyle = "#ffffff"
    context.rect(0, 0, 300, 300)
    context.fill()
  }


  app.dot = function(x,y) {
    context.beginPath()
    context.fillStyle = "#000000"
    context.arc(x,y,1,0,Math.PI*2,true)
    context.fill()
    context.stroke()
    context.closePath()
  }


  app.line = function(fromx,fromy, tox,toy) {
    context.beginPath()
    context.moveTo(fromx, fromy)
    context.lineTo(tox, toy)
    context.stroke()
    context.closePath()
  }


  app.drawstart = function(event) {                   
    event.preventDefault() 
    drawing = true
                    
    lastx = clientX(event) - canvasleft
    lasty = clientY(event) - canvastop

    app.dot(lastx,lasty)
  }
  canvas[eventnames.touchstart] = app.drawstart


  app.drawmove = function(event){                   
    event.preventDefault()                 

    if( !drawing ) return;

    var newx = clientX(event) - canvasleft
    var newy = clientY(event) - canvastop

    app.line(lastx,lasty, newx,newy)
    
    lastx = newx
    lasty = newy
  }
  canvas[eventnames.touchmove] = app.drawmove


  app.drawend = function(event) { 
    event.preventDefault()                   
    drawing = false
  }
  canvas[eventnames.touchend] = app.drawend


  var clearButton = document.getElementById('clear')
  clearButton[eventnames.touchend] = app.clear

  app.clear()
  console.log('end init')
}


window.onload = function() {
  app.init()
}

