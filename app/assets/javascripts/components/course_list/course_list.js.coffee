@CourseList = React.createClass
    displayName: "course-list"
    render: ->
        React.DOM.div
            className: 'course-list col-md-8 col-lg-8 col-xs-8 col-sm-8'
            React.DOM.div
                className: "panel panel-primary"
                React.DOM.div
                    className: "panel-heading"
                    'Courses for Information and Communcation Technology'
                React.DOM.div
                    className: "well"
                    React.DOM.div
                        React.createElement CourseListHeader, localStorageKey: 2, specialisations: @props.specialisations, handleAdvancedSwitch: @props.handleAdvancedSwitch, handleSelectSpec: @props.handleSelectSpec, handleQuarterSelect: @props.handleQuarterSelect, handleSearch: @props.handleSearch
                    React.DOM.div
                        className: 'panel-body'
                        React.createElement CourseListTable, courses: @props.courses, handleAddCourse: @props.handleAddCourse
