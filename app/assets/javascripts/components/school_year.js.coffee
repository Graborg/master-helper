@SchoolYear = React.createClass
    isInRightQuarter: (quarterNo) ->
        (course) ->
            quarterNo.toString() in course.available_quarters
    yearRow: ->
        React.DOM.tr null,
            React.DOM.td null, @props.year + 3
                for quarterNo in [1..4]
                    # Each quarter is a column i.e a table cell.
                    # filter courses that has the right quarterNo
                    filtered = @props.plannedCourses.filter(@isInRightQuarter(quarterNo));
                    React.DOM.td key: quarterNo,
                        React.createElement Quarter, key: quarterNo, courses: filtered, quarterNo: quarterNo
    render: ->
        @yearRow()
