@CourseList = React.createClass
    render: ->
      React.DOM.div
        className: 'course-list col-md-8 col-sm-8'
        React.DOM.div
            className: "panel panel-primary"
            React.DOM.div
                className: "panel-heading"
                'Courses'
                React.DOM.div
                    className: "container"
                    React.DOM.div
                        className: "spec-btn col-md-6 col-sm-6"
                        React.createElement ReactBootstrap.DropdownButton,
                            bsStyle: "info"
                            bsSize: "small"
                            title: "Specialisation"
                            React.createElement ReactBootstrap.MenuItem,
                                title:'Books'
                                'Bookss'
                    React.DOM.div
                        className: "avan-btn col-md-2 col-sm-2"
                    React.DOM.div
                        className: "quarter-btn col-md-2 col-sm-2"
                    React.DOM.div
                        className: "search-field col-md-2 col-sm-2"

              React.DOM.div
                className: 'panel-body'
                amountFormat(@props.amount)


