ItemTypes = {KNIGHT: 'knight'}
knightSource =
    {
    beginDrag: (props) ->
        return {}
    }
collect: (connect, monitor) ->
    return {
        connectDragSource: connect.dragSource(),
        isDragging: monitor.isDragging()
    }
@Knight = React.createClass
    propTypes:{
        connectDragSource: React.PropTypes.func.isRequired,
        isDragging: React.PropTypes.bool.isRequired
    }
    render: ->
        connectDragSource = @props.connectDragSource
        isDragging = @props.isDragging
        React.DOM.div null,
            className: "hejs"
        # connectDragSource(React.DOM.div null)
