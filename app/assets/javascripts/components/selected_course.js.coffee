@SelectedCourse = React.createClass
    removeCourse:(course)->
        @props.handleRemoveCourse course
    render: ->
        React.DOM.div
            className: "course-div " + "quarters-#{@props.course.quarters.length}"
            React.DOM.a
                onClick: @removeCourse.bind(this, @props.course)
                React.createElement ReactBootstrap.Glyphicon,
                    glyph: "remove-circle"
            React.createElement ReactBootstrap.Button,
                onClick: @props.handleChangeQuarter.bind(this, @props.course)
                bsStyle: "primary"
                className: "quarters-#{@props.course.quarters.length}"
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
