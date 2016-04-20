@SchoolYear = React.createClass
    findElementsToInsert: (courses, courseCounter)->
        insert_elements = []
        i = 0
        while i < courseCounter
            occupied = false
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
                        insert_elements.push(course)
                        i += 1
                else 
                    insert_elements.push(null) if not occupied
                    occupied = false
        return insert_elements
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
        elements_to_insert = @findElementsToInsert(quarters_to_course, courseCounter)
        console.log elements_to_insert
        React.DOM.tr null,
            React.DOM.td null, @props.year
                # {Q1: [course1, course5], Q2: [course4, course2], etc }
                # Loop as long as there are elements to insert
                for course, i in elements_to_insert
                    if i > 0
                        React.DOM.tr null, 
                    if course
                        React.DOM.td colSpan: course.quarters.length, key: course.id,
                            React.createElement SelectedCourse, course: course, handleChangeQuarter: @props.handleChangeQuarter, handleRemoveCourse: @props.handleRemoveCourse
                    else
                        React.DOM.td null, ""
