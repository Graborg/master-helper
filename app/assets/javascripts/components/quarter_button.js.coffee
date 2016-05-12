@QuarterButton = React.createClass

    getInitialState: ->
        enabled: false

    pressedQuarter: (e) ->
        @setState enabled: !@state.enabled
        @props.handleQuarterSelect @props.quarter

    render: ->
        React.createElement ReactBootstrap.Button,
            active: @state.enabled
            bsSize: "xsmall"
            onClick: @pressedQuarter
            @props.quarter
