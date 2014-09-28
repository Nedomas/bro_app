angular.module 'ionicstarter'

.factory 'PageDrawer', ->
  draw: (small_full_url, page_coords) ->
    canvas = document.getElementById('page')

    context = canvas.getContext('2d')
    imageObj = new Image()

    imageObj.onload = ->
      context.drawImage(imageObj, 0, 0)

      trapezoid = page_coords
      context.beginPath()
      # context.moveTo(trapezoid[0].x, trapezoid[0].y)

      _.each trapezoid, (coords) ->
        context.lineTo(coords[0], coords[1])

      context.closePath()
      context.lineWidth = 3
      context.strokeStyle = '#ff0000'
      context.stroke()

    imageObj.src = small_full_url
