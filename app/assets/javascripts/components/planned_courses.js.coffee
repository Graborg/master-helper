
@PlannedCourses = React.createClass

  getInitialState: ->
    courses: @props.courses
    plannedCourses: [{course_code: 1, credits: 30, course_name: "Master Thesis", course_length: 2, quarters:"12", available_quarters: "123", selectedQuarter:"3", selectedYear: 5}]
    credits: {spec: 0, adv: 30, advSpec: 0, total: 30}
    onlyAdvanced: false
    quarters: {1: true, 2: true, 3: true, 4: true }
    specialisations: @props.specialisations
    specialisation: "all"

  getDefaultProps: ->
    courses: []
    plannedCourses: [{course_code: 1, credits: 30, course_name: "Master Thesis", course_length: 2, quarters:"12", available_quarters: "123", selectedQuarter:"3", selectedYear: 5}]
    credits: {spec: 0, adv: 30, advSpec: 0, total: 30}
    quarters: {1: true, 2: true, 3: true, 4: true }
    specialisations: []
    specialisation: "all"

  filterCoursesp: (c) ->
    filteredCourses = c.filter(@filterBy("spec", @state.specialisation))
    if @state.onlyAdvanced
        filteredCourses = filteredCourses.filter(@filterBy("onlyAdvanced", @state.onlyAdvanced))
     #Convert quarter buttons pressed to string, to be compared with courses' quarters
    selectedQString = ""
    for k of @state.quarters
        selectedQString += k.toString() if @state.quarters[k]
    filteredCourses = filteredCourses.filter(@filterBy("quarters", selectedQString))
    filteredCourses

  filterBy: (key, value) ->
        (course) ->
            if key == 'onlyAdvanced'
                course.level == "A"
            else if key == 'spec'
                course.specialisation == value || value == "all"
            else if key == 'quarters'
                inQ = false
                for q in value
                    #if any of the numbers in q match any of the numbers in course.quarters
                    inQ = q in course.quarters if !inQ
                inQ
            else
               true

  selectQuarters: (quarterHash) ->
    @setState quarters: quarterHash

  selectSpec: (spec) ->
    @setState specialisation: spec

  advancedSwitch: (e) ->
    @setState onlyAdvanced: !@state.onlyAdvanced

  search: (searchString)->
    console.log searchString

  addCredits: (course) ->
    creditsHash = @state.credits
    if course.specialisation
        creditsHash.spec += course.credits
    if course.level == "A"
        creditsHash.adv += course.credits
    if course.specialisation and course.level == "A"
        creditsHash.advSpec += course.credits
    creditsHash.total += course.credits
    @setState credits: creditsHash

  removeCredits: (course) ->
    creditsHash = @state.credits
    if course.specialisation
        creditsHash.spec -= course.credits
    if course.level == "A"
        creditsHash.adv -= course.credits
    if course.specialisation and course.level == "A"
        creditsHash.advSpec -= course.credits
    creditsHash.total -= course.credits
    @setState credits: creditsHash

  addCourse: (course) ->
    index = @state.courses.indexOf course
    @addCredits(course)
    plannedCourse = {}
    for key of course
        plannedCourse[key] = course[key]
    plannedCourse.id = plannedCourse.id * 10000
    plannedCourse.index = index
    plannedCourse.selectedQuarter = plannedCourse.quarters[0]
    plannedCourse.selectedYear = 4
    plannedCourses = React.addons.update(@state.plannedCourses, { $push: [plannedCourse] })
    courses = React.addons.update(@state.courses, { $splice: [[index, 1]] })
    @setState plannedCourses: plannedCourses
    @setState courses: courses

  removeCourse: (course) ->
    #Remove course from 'planned courses'
    index = @state.plannedCourses.indexOf course
    @removeCredits(course)
    plannedCourses = React.addons.update(@state.plannedCourses, { $splice: [[index, 1]] })
    #Readd course to course list
    course.id = course.id / 10000
    # This needs to be added at the right index
    courses = React.addons.update(@state.courses, { $splice: [[course.index, 0, course]] })
    # new_courses = React.addons.update(@state.courses, { $push: [course] })
    @setState plannedCourses: plannedCourses
    @setState courses: courses
  changeQuarter: (course) ->
    qIndex = (course.quarters.indexOf course.selectedQuarter) + 1
    courseIndex = @state.plannedCourses.indexOf course
    plannedCourses = @state.plannedCourses
    if ! course.quarters[qIndex]?
        qIndex = 0
        newYear = if course.selectedYear == 5 then 4 else 5
        course.selectedYear = newYear
    course.selectedQuarter = course.quarters[qIndex]
    plannedCourses[courseIndex] = course
    @setState plannedCourses: plannedCourses

  updateCourse: (course, data) ->
    index = @state.courses.indexOf course
    courses = React.addons.update(@state.courses, { $splice: [[index, 1, data]] })
    @replaceState courses: courses

  render: ->
    courses = @filterCoursesp(@state.courses)
    React.DOM.div
        className: 'well'
        React.DOM.div
            className: 'row'
            React.DOM.table
                className: 'table'
                React.DOM.thead null,
                  React.DOM.tr null,
                    React.DOM.th id: 'year-col'
                    React.DOM.th null, 'LP1'
                    React.DOM.th null, 'LP2'
                    React.DOM.th null, 'LP3'
                    React.DOM.th null, 'LP4'
                React.DOM.tbody id: "selectedCourses",
                    React.createElement SchoolYear, key: 1, plannedCourses: @state.plannedCourses, year: 4, handleChangeQuarter: @changeQuarter, handleRemoveCourse: @removeCourse
                    React.createElement SchoolYear, key: 2, plannedCourses: @state.plannedCourses, year: 5, handleChangeQuarter: @changeQuarter, handleRemoveCourse: @removeCourse
            React.DOM.div
                className: 'container course-credits'
            React.createElement CourseList, courses: courses, specialisations: @state.specialisations, handleAddCourse: @addCourse, handleAdvancedSwitch: @advancedSwitch, handleSelectSpec: @selectSpec, handleQuarterSelect: @selectQuarters, handleSearch: @search
            React.createElement CreditsBox, credits: @state.credits