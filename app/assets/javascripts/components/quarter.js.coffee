@Quarter = React.createClass
    render: ->
        React.DOM.div
            className: "quarter-#{@props.quarterNo}"
            for course in @props.courses
                React.createElement Course, key: course.id, course: course