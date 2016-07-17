@SourceObjects = React.createClass
  render: ->
    React.DOM.div
      className: 'dnd-source-objects'
      children: for object, i in @props.objects
        React.createElement SourceObject, type: object.type, index: i + 1, children: i + 1, onDragStart: @props.onDragStart, onDragStop: @props.onDragStop

@SourceObject = React.createClass
  render: ->
    React.createElement Draggable, classs: "dnd-source-object #{@props.type}", children: @props.children, onDragStart: @props.onDragStart, onDragStop: @props.onDragStop, dragData: @dragData

  dragData: ->
    type: @props.type
    index: @props.index
