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
      "#{@props.target.quarter}"
      'active' if @active()
      'disabled' if @disabled()
      'hover' if @state.hover
    ].join ' '

  active: ->
    item = @props.currentDragItem
    if item
        target = @props.target
        draggedCourse = item.course
        
        rightQuarter = target.quarter in draggedCourse.available_quarters.toString().split("")
        currentSlot = draggedCourse.selectedQuarter == target.quarter and draggedCourse.selectedYear == target.year
        
        return rightQuarter and not currentSlot

  disabled: ->
    item = @props.currentDragItem
    item and @props.target.quarter not in item.course.available_quarters.toString().split("")

  acceptsDescription: ->
    if @props.target.quarter.length > 0
      @props.target.quarter + ' & '
    else
      'nothing'

  onDrop: ->
    if @active()
      @props.onDrop? quarter: @props.quarterNo, year: @props.year
