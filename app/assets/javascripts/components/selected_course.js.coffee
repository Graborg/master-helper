@SelectedCourse = React.createClass
    render: ->
        React.createElement ReactBootstrap.Button,
            onClick: @props.handleChangeQuarter.bind(this, @props.course)
            bsStyle: "primary"
            React.DOM.div
                className: 'row'
                React.DOM.div
                    className: 'course-id col-md-6 col-sm-6 col-xs-6'
                    "#{@props.course.course_code}"
                React.DOM.div
                    className: 'course-credits col-md-6 col-sm-6 col-xs-6'
                    "#{@props.course.credits} hp"
            React.DOM.div
                className: 'row'
                React.DOM.div
                    className: 'course-name col-md-12 col-sm-12'
                    @props.course.course_name
