@Alert = React.createClass
    displayName: "alert"
    render: ->
        React.createElement ReactBootstrap.Alert,
            bsStyle:"warning"
            className: "warning"
            onClick: @props.handleDismissAlert
            "Sorry. That function is under development"
