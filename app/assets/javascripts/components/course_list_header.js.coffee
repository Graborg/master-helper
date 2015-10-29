@CourseListHeader = React.createClass
    render: ->
        React.DOM.div
            className: "courselist-container container"
            React.DOM.div
                className: "courselist-buttons row"
                React.DOM.div
                    className:"col-lg-3 col-md-3 col-sm-4 col-xs-4"
                    React.createElement ReactBootstrap.DropdownButton,
                        bsStyle: "info"
                        bsSize: "small"
                        title: "Specialisation"
                        React.createElement ReactBootstrap.MenuItem,
                            title:'Books'
                            'Bookss'
                React.DOM.div
                    className: "col-lg-3 col-md-3 col-sm-3 col-xs-3"
                    React.createElement ReactBootstrap.Button,
                        bsStyle: "info"
                        bsSize: "small"
                        "Advanced"
                React.DOM.div
                    className: "col-lg-3 col-md-3 col-sm-3 col-xs-3"
                    React.createElement ReactBootstrap.DropdownButton,
                        bsStyle: "info"
                        bsSize: "small"
                        title: "Quarter"
                        React.createElement ReactBootstrap.MenuItem,
                            title:'Books'
                            'Bookss'
                React.DOM.div
                    className: "search-field col-lg-3 col-md-3 col-sm-2 col-xs-2"
                    React.createElement Search

