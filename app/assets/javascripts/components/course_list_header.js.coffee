@CourseListHeader = React.createClass
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
                            React.createElement Specialisation, key: specialisation, specialisation: specialisation
                React.DOM.div
                    className: "col-lg-2 col-md-2 col-sm-2 col-xs-2"
                    React.createElement AdvancedSwitch, handleAdvancedSwitch: @props.handleAdvancedSwitch
                React.DOM.div
                    className: "col-lg-2 col-md-2 col-sm-3 col-xs-3 quarter-select"
                    React.DOM.div
                        className: "container c"
                        React.DOM.div
                            className: "row"
                            for q in [1..4]
                                React.createElement QuarterButton, key: q, handleQuarterSelect: @props.handleQuarterSelect, quarter: q
                React.DOM.div
                    className: "search-field col-lg-5 col-md-4 col-sm-4 col-xs-2"
                    React.createElement Search, handleSearch: @search
