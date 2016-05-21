@SelectedCourse = React.createClass
    displayName: "selected_course"
    removeCourse: ->
        @props.handleRemoveCourse @props.course
    changeQuarter: ->
        @props.handleChangeQuarter @props.course
    render: ->
        React.DOM.div
            className: "course-div " + "quarters-#{@props.course.quarters.length}"
            React.DOM.a
                onClick: @removeCourse
                className: "hidden-element" if @props.course.notClosable
                React.createElement ReactBootstrap.Glyphicon,
                    glyph: "remove-circle"
            React.createElement ReactBootstrap.Button,
                onClick: @changeQuarter
                bsStyle: "primary"
                className: "selected-course"
                React.DOM.div
                    className: 'row'
                    React.DOM.div
                        className: 'course-id col-md-6 col-sm-6 col-xs-6'
                        "#{@props.course.course_code}"
                    React.DOM.div
                        className: 'course-credits col-md-6 col-sm-6 col-xs-6'
                        "#{@props.course.credits} hp  "
                React.DOM.div
                    className: 'row'
                    React.DOM.div
                        className: 'course-name col-md-12 col-sm-12'
                        @props.course.course_name
