@getSpec = (course) ->
    if course.specialisation
        course.specialisation
    else
        ''
@showQuarters = (course, quarter) ->
    match = (new RegExp(quarter)).test(course.quarters)
    if match then "success" else "default"
@CourseListRow = React.createClass
    displayName: "course_list_row"
    handleAdd: ->
        @props.handleAddCourse(@props.course)
    render: ->
        levelBadge = if @props.course.level is "A" then "badge advanced-badge" else "badge other-level"
        React.DOM.tr
            className: @props.course.class
            id: @props.course
            React.DOM.a
                onClick: @handleAdd
                React.DOM.td colSpan:"2",
                    React.DOM.span className:"label label-success",
                        @props.course.course_name
                React.DOM.td null,
                    React.DOM.span className: "label label-success",
                        @props.course.course_code
                React.DOM.td className: "hplevelspec",
                    React.DOM.span className: "badge hp-badge",
                        @props.course.credits + " hp"
                    React.DOM.span className: levelBadge,
                        @props.course.level
                    if @props.course.specialisation
                        React.DOM.span className: "badge spec-badge",
                            @props.course.specialisation
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
