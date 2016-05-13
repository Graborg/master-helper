@Specialisation = React.createClass
    selectSpec: ->
        @props.handleSelectSpec @props.specialisation

    render: ->
        React.createElement ReactBootstrap.MenuItem,
            key: @props.specialisation
            title: @props.specialisation
            onSelect: @selectSpec
            @props.specialisation
