@SchoolYear = React.createClass

    # Return elements in DOM-order
    dom_elements: (courses, courseCounter) ->
        insert_elements = []
        i = 0
        rows = 0
        while i < courseCounter
            occupied = false
            temp = []
            for quarterNo in [1..4]
                # Loop through all quarters and pop one element for each quarter
                course = courses[quarterNo].shift()
                # Items can only strech 2 quarters
                if course
                    if occupied
                        courses[quarterNo].unshift(course)
                        occupied = false
                        continue
                    else
                        occupied = course.quarters.length > 1
                        temp.push(
                            React.DOM.td colSpan: course.quarters.length, key: course.id,
                              React.createElement SelectedCourse, course: course, handleChangeQuarter: @props.handleChangeQuarter, handleRemoveCourse: @props.handleRemoveCourse
                        )
                        i += 1
                else
                    temp.push(React.DOM.td null, "") if not occupied
                    occupied = false
                if quarterNo == 4
                  rows += 1
                  insert_elements.push(React.DOM.tr null, temp)
        insert_elements.unshift(React.DOM.tr null, React.DOM.td rowSpan:rows+1, @props.year)
        return insert_elements

    # Return a hash with the different courses mapped with the different quarters
    # and the amount of courses
    coursesInQuarters: (courses) ->
        hash = {}
        courseCounter = 0
        for quarterNo in [1..4]
            hash[quarterNo] = courses.filter(@isInRightQuarterAndYear(quarterNo, @props.year));
            courseCounter += hash[quarterNo].length
        return [hash, courseCounter]


    isInRightQuarterAndYear: (quarterNo, year) ->
        (course) ->
            quarterNo.toString() in course.selectedQuarter and year == course.selectedYear


    render: ->
        coursesInQuarters = @coursesInQuarters(@props.plannedCourses)
        quarters_to_course = coursesInQuarters[0]
        courseCounter = coursesInQuarters[1]
        React.DOM.tbody id: "selectedCourses",
          @dom_elements(quarters_to_course, courseCounter)
