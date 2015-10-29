@CourseList = React.createClass
    render: ->
        React.DOM.div
            className: 'course-list col-md-8 col-lg-8 col-xs-8 col-sm-8'
            React.DOM.div
                className: "panel panel-primary"
                React.DOM.div
                    className: "panel-heading"
                    'Courses'
                    React.createElement CourseListHeader
                React.DOM.div
                    className: 'panel-body'
                    React.createElement CourseListTable


