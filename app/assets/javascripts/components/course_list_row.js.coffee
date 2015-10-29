@getSpec = (course) ->
    if course.specilisation
        course.specilisation
    else
        'None'
@showQuarters = (course, quarter) ->
    match = (new RegExp(quarter)).test(course.available_quarters)
    if match then "success" else "default"
@CourseListRow = React.createClass
    handleAdd: ->
        console.log(@props.course)
    render: ->
        React.DOM.a
            className: "add"
            onClick: @handleAdd
            React.DOM.tr null,
                React.DOM.td colSpan:"2", @props.course.course_name
                React.DOM.td null, @props.course.course_code
                React.DOM.td null, @props.course.credits + " hp/" + @props.course.level + "/" + getSpec(@props.course)
                React.DOM.td className: "quarters",
                    React.DOM.span
                        className:"label label-#{showQuarters(@props.course, 1)}"
                        1
                    React.DOM.span
                        className:"label label-#{showQuarters(@props.course, 2)}"
                        2
                    React.DOM.span
                        className:"label label-#{showQuarters(@props.course, 3)}"
                        3
                    React.DOM.span
                        className:"label label-#{showQuarters(@props.course, 4)}"
                        4
                React.DOM.td id: "add-link",
                    React.createElement ReactBootstrap.Glyphicon,
                        glyph: "plus-sign"
