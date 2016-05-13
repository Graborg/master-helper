@QuarterButton = React.createClass

    getInitialState: ->
        enabled: false

    pressedQuarter: (e) ->
        @setState enabled: !@state.enabled
        @props.handleQuarterSelect @props.quarter

    render: ->
        React.createElement ReactBootstrap.Button,
            className: "quarter-filter"
            active: @state.enabled
            bsSize: "xsmall"
            bsStyle: "info"
            onClick: @pressedQuarter
            @props.quarter
