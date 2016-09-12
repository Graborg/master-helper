@SchoolYear = React.createClass
    displayName: "school_year"
    # Return elements in DOM-order
    dom_elements: (courses, courseCounter) ->
        insert_elements = []
        i = 0
        rows = 0
        targets =
        [
          { accepts: ['1'] }
          { accepts: ['2'] }
          { accepts: ['3'] }
          { accepts: ['4'] }
        ]

        loop
            occupied = false
            temp = []
            # Loop through all quarters and pop one element for each quarter
            for quarterNo in [1..4]
                course = courses[quarterNo].shift()
                if course
                    # If the space is occupied, put it back and move on
                    if occupied
                        courses[quarterNo].unshift(course)
                        occupied = false
                        continue
                    else
                        occupied = course.quarters.length > 1
                        # Push element as intended
                        temp.push(
                            React.DOM.td colSpan: course.quarters.length, key: i,
                              React.createElement SelectedCourse, key: i-5000, course: course, handleChangeQuarter: @props.handleChangeQuarter, handleRemoveCourse: @props.handleRemoveCourse, onDragStart: @props.onDragStart, onDragStop: @props.onDragStop, dragData: @dragData
                        )
                        i += 1
                # Nothing left in that quarter to push, push an empy td to fill out the space
                else
                    temp.push(@createEmptytd(i, quarterNo, rows, targets[quarterNo - 1])) if not occupied
                    occupied = false
                    # If the row is filled, we switch row
                if quarterNo == 4
                  rows += 1
                  insert_elements.push(React.DOM.tr key: i + rows, temp)
            break if i >= courseCounter
        insert_elements.unshift(React.DOM.tr key: rows + i + @props.year , React.DOM.td rowSpan:rows+1, @props.year)
        return insert_elements

    createEmptytd: (i, quarterNo, rows, target) ->
        React.createElement DropTarget, key: i + quarterNo + rows + 5000, currentDragItem: @props.currentDragItem, onDrop: @props.onDrop, target: target, quarterNo: quarterNo, year: @props.year


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
        React.DOM.tbody className: "selectedCourses",
          @dom_elements(quarters_to_course, courseCounter)
