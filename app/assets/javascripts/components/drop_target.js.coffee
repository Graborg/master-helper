@DropTarget = React.createClass
  getInitialState: ->
    hover: false

  render: ->
    React.DOM.div
      className: @classes()
      children: 'accepts ' + @acceptsDescription()
      onMouseUp: @onDrop
      onMouseEnter: => @setState hover: true
      onMouseLeave: => @setState hover: false

  classes: ->
    [
      'dnd-drop-target'
      "#{@props.target.accepts.join ' '}"
      'active' if @active()
      'active-green' if @active() and @props.currentDragItem.type == 'green'
      'active-blue' if @active() and @props.currentDragItem.type == 'blue'
      'disabled' if @disabled()
      'hover' if @state.hover
    ].join ' '

  active: ->
    item = @props.currentDragItem
    hej = item and item.type in @props.target.accepts

  disabled: ->
    item = @props.currentDragItem
    item and item.type not in @props.target.accepts

  acceptsDescription: ->
    if @props.target.accepts.length > 0
      @props.target.accepts.join ' & '
    else
      'nothing'

  onDrop: ->
    console.log @props.currentDragItem
    console.log @props.target.accepts
    if @active()
      console.log "nkro"
      @props.onDrop? index: @props.index + 1
