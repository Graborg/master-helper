@Alert = React.createClass
    render: ->
        React.createElement ReactBootstrap.Alert,
            bsStyle:"warning"
            className: "warning"
            onClick: @props.handleDismissAlert
            "Sorry. That function is under development"
