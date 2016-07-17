LEFT_BUTTON = 0
DRAG_THRESHOLD = 3 # pixels

@Draggable = React.createClass
  getInitialState: ->
    mouseDown: false
    dragging: false

  render: ->
    React.DOM.div
      style: @style()
      className: "dnd-draggable #{'dragging' if @state.dragging} " + @props.classs
      children: @props.children
      onMouseDown: @onMouseDown

  style: ->
    if @state.dragging
      position: 'absolute'
      left: @state.left
      top: @state.top
    else
      {}

  onMouseDown: (event) ->
    if event.button == LEFT_BUTTON
      event.stopPropagation()
      @addEvents()
      pageOffset = @getDOMNode().getBoundingClientRect()
      @setState
        mouseDown: true
        originX: event.pageX
        originY: event.pageY
        elementX: pageOffset.left
        elementY: pageOffset.top

  onMouseMove: (event) ->
    deltaX = event.pageX - @state.originX
    deltaY = event.pageY - @state.originY
    distance = Math.abs(deltaX) + Math.abs(deltaY)

    if !@state.dragging and distance > DRAG_THRESHOLD
      @setState dragging: true
      @props.onDragStart? @props.dragData?()

    if @state.dragging
      @setState
        left: @state.elementX + deltaX + document.body.scrollLeft
        top: @state.elementY + deltaY + document.body.scrollTop

  onMouseUp: ->
    @removeEvents()
    if @state.dragging
      @props.onDragStop()
      @setState dragging: false

  addEvents: ->
    document.addEventListener 'mousemove', @onMouseMove
    document.addEventListener 'mouseup', @onMouseUp

  removeEvents: ->
    document.removeEventListener 'mousemove', @onMouseMove
    document.removeEventListener 'mouseup', @onMouseUp
