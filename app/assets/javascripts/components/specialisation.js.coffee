@Specialisation = React.createClass
    displayName: "specialisation"
    selectSpec: (e) ->
        @props.handleSelectSpec @props.specialisation

    render: ->
        id = if (@props.title is @props.specialisation) then "active-spec" else ""
        React.createElement ReactBootstrap.MenuItem,
            id: id
            title: @props.specialisation
            onSelect: @selectSpec
            @props.specialisation
