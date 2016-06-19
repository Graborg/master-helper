# PropTypes = React.PropTypes
@Square = React.createClass
    propTypes:{
        black: React.PropTypes.bool,
        title: React.PropTypes.string
    }
    getDefaultProps:->
        {
            black: true
        }
    render: ->
        black = @props.black
        fill = if black then 'black' else 'white'
        stroke = if black then 'white' else 'black'
        React.DOM.div
            style: {backgroundColor: fill, width: '100%', height: '100%', color: stroke}
            @props.children
