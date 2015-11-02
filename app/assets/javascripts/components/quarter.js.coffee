@Quarter = React.createClass
    render: ->
        React.DOM.div
            className: "quarter"
            for course in @props.courses
                React.createElement SelectedCourse, key: course.id, course: course, handleChangeQuarter: @props.handleChangeQuarter