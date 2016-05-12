@AdvancedSwitch = React.createClass
    getInitialState: ->
        disabled: false
    click: (e) ->
        @setState disabled: !@state.disabled
        @props.handleAdvancedSwitch e
    render: ->
        React.createElement ReactBootstrap.Button,
            active: @state.disabled
            onClick: @click
            id: "advanced-switch"
            bsStyle: "info"
            bsSize: "small"
            "Advanced"
