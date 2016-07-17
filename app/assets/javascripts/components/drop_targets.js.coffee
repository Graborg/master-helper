@DropTargets = React.createClass
  render: ->
    React.DOM.div
      className: 'dnd-drop-targets'
      children: for target, i in @targets()
        React.createElement DropTarget, target: target, index: i, currentDragItem: @props.currentDragItem, onDrop: @props.onDrop

  targets: ->
    [
      { accepts: ['blue'] }
      { accepts: ['green'] }
      { accepts: ['blue', 'green'] }
      { accepts: [] }
    ]
