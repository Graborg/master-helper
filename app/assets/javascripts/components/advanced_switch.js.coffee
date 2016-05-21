@AdvancedSwitch = React.createClass
    displayName: "advanced-switch"
    getInitialState: ->
        disabled: false
    click: (e) ->
        @setState disabled: !@state.disabled
        @props.handleAdvancedSwitch e
    render: ->
        React.createElement ReactBootstrap.Button,
            active: @state.disabled
            onClick: @click
            className: "btn"
            id: "advanced-switch"
            bsSize: "small"
            "Advanced"
