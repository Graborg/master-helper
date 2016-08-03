@DropTarget = React.createClass
  getInitialState: ->
    hover: false

  render: ->
    React.DOM.td
        className: @classes()
        children: 'accepts ' + @acceptsDescription()
        onMouseUp: @onDrop
        onMouseEnter: => @setState hover: true
        onMouseLeave: => @setState hover: false
        ""

  classes: ->
    [
      'dnd-drop-target'
      "#{@props.target.accepts.join ' '}"
      'active' if @active()
      'active-green' if @active() # and @props.currentDragItem.available_quarters == 'green'
      'disabled' if @disabled()
      'hover' if @state.hover
    ].join ' '

  active: ->
    item = @props.currentDragItem
    item and @props.target.accepts[0] in item.available_quarters.toString().split("")

  disabled: ->
    item = @props.currentDragItem
    item and @props.target.accepts[0] not in item.available_quarters.toString().split("")

  acceptsDescription: ->
    if @props.target.accepts.length > 0
      @props.target.accepts.join ' & '
    else
      'nothing'

  onDrop: ->
    if @active()
      @props.onDrop? quarter: @props.quarterNo, year: @props.year
