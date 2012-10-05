$ ->
  $(".svg-wrapper svg").svg
    onLoad: ->
      p1 = [Math.floor(Math.random()*1000), Math.floor(Math.random()*800)]
      p2 = [Math.floor(Math.random()*1000), Math.floor(Math.random()*800)]
      p3 = [Math.floor(Math.random()*1000), Math.floor(Math.random()*800)]
      p = [Math.floor(Math.random()*1000), Math.floor(Math.random()*800)]
      console.log "P1:", p1
      console.log "P2:", p2
      console.log "P3:", p3
      console.log "P:", p
      wrapper = $('.svg-wrapper')
      svg = wrapper.find('svg').svg 'get'
      svg.circle p1[0], p1[1], 3
      svg.circle p2[0], p2[1], 3
      svg.circle p3[0], p3[1], 3
      svg.circle p[0], p[1], 3,
        fill: "red"
      d1 = Math.sqrt(Math.pow(p1[0]-p[0], 2) + Math.pow(p1[1]-p[1], 2))
      d2 = Math.sqrt(Math.pow(p2[0]-p[0], 2) + Math.pow(p2[1]-p[1], 2))
      d3 = Math.sqrt(Math.pow(p3[0]-p[0], 2) + Math.pow(p3[1]-p[1], 2))
      svg.circle p1[0], p1[1], d1,
        "stroke-width": 1
        "stroke-dasharray": "5"
        stroke: "black"
        fill: "none"
      svg.circle p2[0], p2[1], d2,
        "stroke-width": 1
        "stroke-dasharray": "5"
        stroke: "black"
        fill: "none"
      svg.circle p3[0], p3[1], d3,
        "stroke-width": 1
        "stroke-dasharray": "5"
        stroke: "black"
        fill: "none"
      svg.line p1[0], p1[1], p[0], p[1],
        "stroke-width": 1
        "stroke-dasharray": "10"
        stroke: "red"
        fill: "none"
      svg.line p2[0], p2[1], p[0], p[1],
        "stroke-width": 1
        "stroke-dasharray": "10"
        stroke: "red"
        fill: "none"
      svg.line p3[0], p3[1], p[0], p[1],
        "stroke-width": 1
        "stroke-dasharray": "10"
        stroke: "red"
        fill: "none"
      d = Math.sqrt(Math.pow(p2[0]-p1[0], 2) + Math.pow(p2[1]-p1[1], 2))
      ex = [(p2[0]-p1[0])/d, (p2[1]-p1[1])/d]
      i = ex[0] * (p3[0]-p1[0]) + ex[1] * (p3[1]-p1[1])
      ed = Math.sqrt(Math.pow(p3[0]-p1[0]-i*ex[0], 2) + Math.pow(p3[1]-p1[1]-i*ex[1], 2))
      ey = [(p3[0]-p1[0]-i*ex[0])/ed, (p3[1]-p1[1]-i*ex[1])/ed]
      ez = [ex[0]*ey[0], ex[1]*ey[1]]
      j = ey[0] * (p3[0]-p1[0]) + ey[1] * (p3[1]-p1[1])
      x = (d1*d1 - d2*d2 + d*d)/(2*d)
      y = (d1*d1 - d3*d3 + i*i + j*j)/(2*j) - (i*x)/j
      z = Math.sqrt(Math.abs(d1*d1 - x*x - y*y))
      o = [p1[0] + x*ex[0] + y*ey[0] + z*ez[0], p1[1] + x*ex[1] + y*ey[1] + z*ez[1]]
      console.log "O:", o
      svg.circle o[0], o[1], 15,
        "stroke-width": 1
        stroke: "red"
        fill: "none"
