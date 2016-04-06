@SchoolYear = React.createClass
    isInRightQuarterAndYear: (quarterNo, year) ->
        (course) ->
            quarterNo.toString() in course.selectedQuarter and year == course.selectedYear
    render: ->
        React.DOM.tr null,
            React.DOM.td null, @props.year
                for quarterNo in [1..4]
                    # Each quarter is a column i.e a table cell.
                    # filter courses that has the right quarterNo
                    filtered = @props.plannedCourses.filter(@isInRightQuarterAndYear(quarterNo, @props.year));
                    React.DOM.td key: quarterNo,
                        React.createElement Quarter, key: quarterNo, courses: filtered, quarterNo: quarterNo, handleChangeQuarter: @props.handleChangeQuarter, handleRemoveCourse: @props.handleRemoveCourse