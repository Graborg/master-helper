@CourseListHeader = React.createClass
    getInitialState: ->
        quartersPressed: {1: true, 2: true, 3: true, 4: true }
    getBtnStyle: (quarter) ->
        if @state.quartersPressed[quarter] then "info" else "default"
    pressedQuarter: (quarter) ->
        q = @state.quartersPressed
        q[quarter] = !q[quarter]
        @setState quartersPressed: q
        @props.handleQuarterSelect q
    render: ->
        React.DOM.div
            className: "courselist-container container"
            React.DOM.div
                className: "courselist-buttons row"
                React.DOM.div
                    className:"col-lg-3 col-md-3 col-sm-3 col-xs-3"
                    React.createElement ReactBootstrap.DropdownButton,
                        bsStyle: "info"
                        bsSize: "small"
                        title: "Specialisation"
                        for specialisation in @props.specialisations
                            React.createElement ReactBootstrap.MenuItem,
                                title:specialisation
                                onSelect: @props.handleSelectSpec.bind(this, specialisation)
                                specialisation
                React.DOM.div
                    className: "col-lg-2 col-md-2 col-sm-2 col-xs-2"
                    React.createElement AdvancedSwitch, handleAdvancedSwitch: @props.handleAdvancedSwitch
                React.DOM.div
                    className: "col-lg-2 col-md-2 col-sm-3 col-xs-3 quarter-select"
                    React.DOM.div
                        className: "container c"
                        React.DOM.div
                            className: "row"
                            React.createElement ReactBootstrap.Button,
                                bsStyle: @getBtnStyle(1)
                                bsSize: "xsmall"
                                onClick: @pressedQuarter.bind(this, 1)
                                1
                            React.createElement ReactBootstrap.Button,
                                bsStyle: @getBtnStyle(2)
                                bsSize: "xsmall"
                                onClick: @pressedQuarter.bind(this, 2)
                                2
                            React.createElement ReactBootstrap.Button,
                                bsStyle: @getBtnStyle(3)
                                bsSize: "xsmall"
                                onClick: @pressedQuarter.bind(this, 3)
                                3
                            React.createElement ReactBootstrap.Button,
                                bsStyle: @getBtnStyle(4)
                                bsSize: "xsmall"
                                onClick: @pressedQuarter.bind(this, 4)
                                4
                React.DOM.div
                    className: "search-field col-lg-5 col-md-4 col-sm-4 col-xs-2"
                    React.createElement Search, handleSearch: @search