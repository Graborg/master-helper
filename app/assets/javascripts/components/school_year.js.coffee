@SchoolYear = React.createClass
    isInRightQuarterAndYear: (quarterNo, year) ->
        (course) ->
            quarterNo.toString() in course.selectedQuarter and year == course.selectedYear
    render: ->
        React.DOM.tr null,
            # Create "Year"(4 or 5) td
            React.DOM.td null, @props.year
                #Iterate row by row
                quarters_to_course = {}
                for quarterNo in [1..4]
                    quarters_to_course[quarterNo] = @props.plannedCourses.filter(@isInRightQuarterAndYear(quarterNo, @props.year));
                i = 0
                while i < @props.plannedCourses.length
                    occupied = false
                    insert_elements = []
                    for quarterNo in [1..4]
                        # Loop through all quarters and pop one element for each quarter
                        course = quarters_to_course[quarterNo].shift()
                        if course
                            if occupied
                                quarters_to_course[quarterNo].unshift(course)
                                occupied = false
                                continue
                            else
                                occupied = course.quarters.length > 1
                                insert_elements.push(course)
                        else if not occupied
                            occupied = false
                            insert_elements.push(null)
                    i += 1
                    if i > 1
                        React.DOM.tr null,
                    for course in insert_elements
                        if course == null
                            React.DOM.td null, ""
                        else
                            React.DOM.td colSpan: course.quarters.length, key: course.id,
                                React.createElement SelectedCourse, course: course, handleChangeQuarter: @props.handleChangeQuarter, handleRemoveCourse: @props.handleRemoveCourse
