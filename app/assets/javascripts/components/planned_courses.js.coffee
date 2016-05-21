
@PlannedCourses = React.createClass
  mixins: [LocalStorageMixin]
  getInitialState: ->
    courses: @props.courses
    plannedCourses: [{course_code: 1, credits: 30, course_name: "Master Thesis", course_length: 2, quarters:"12", available_quarters: "123", selectedQuarter:"3", selectedYear: 5, notClosable: true}]
    credits: {spec: 0, adv: 30, advSpec: 0, total: 30}
    onlyAdvanced: false
    quarters: [false, false, false, false]
    specialisations: ["All"].concat @props.specialisations
    specialisation: "All"
    showAlert: false

  getDefaultProps: ->
    courses: []
    plannedCourses: [{course_code: 1, credits: 30, course_name: "Master Thesis", course_length: 2, quarters:"12", available_quarters: "123", selectedQuarter:"3", selectedYear: 5, notClosable: true}]
    credits: {spec: 0, adv: 30, advSpec: 0, total: 30}
    quarters: [false, false, false, false]
    specialisations: []
    localStorageKey: 1
    specialisation: "All"

  filterCoursesp: ->
    for course in @state.courses
        display = false
        # specialisation filter
        if course.specialisation == @state.specialisation or @state.specialisation == "All"
            display = true
        # advanced filter
        if @state.onlyAdvanced and course.level isnt "A"
            display = false
        # quarter filter
        quarterFilter = true in @state.quarters
        if quarterFilter is on
            startingQuarter = course.quarters[0]
            # Check if the course starting quarter isn't allowed in @state.quarters
            if not @state.quarters[startingQuarter - 1]
                display = false
        # final verdict
        if display
            course.class = course.class.replace(' hidden-element','') if course.class
        else if course.class isnt " hidden-element"
            course.class = if course.class then course.class + " hidden-element" else " hidden-element"
    @state.courses

  selectQuarters: (quarter) ->
    enabled = @state.quarters[quarter-1]
    # quarters = React.addons.update(@state.quarters, {"#{quarter}": {$set: !@state.quarters[quarter] }});
    quarters = React.addons.update(@state.quarters, { $splice: [[quarter-1, 1, !enabled]] })
    @setState quarters: quarters

  selectSpec: (spec) ->
    @setState specialisation: spec

  advancedSwitch: (e) ->
    @setState onlyAdvanced: !@state.onlyAdvanced

  search: (searchString)->
    @setState showAlert: true

  dismissAlert: (e) ->
    @setState showAlert: false

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

# Add course to planned courses
  addCourse: (course) ->
    @addCredits(course)
    index = @state.courses.indexOf course
    plannedCourse = {}
    for key of course
        plannedCourse[key] = course[key]
    plannedCourse.id = plannedCourse.id * 10000
    plannedCourse.index = index
    plannedCourse.selectedQuarter = plannedCourse.quarters[0]
    plannedCourse.selectedYear = 4
    plannedCourses = React.addons.update(@state.plannedCourses, { $push: [plannedCourse] })
    course.class = if course.class then course.class + " hidden-row" else " hidden-row"
    courses = React.addons.update(@state.courses, { $splice: [[index, 1, course]] })
    @setState plannedCourses: plannedCourses
    @setState courses: courses

  removeCourse: (course) ->
    #Remove course from 'planned courses'
    index = @state.plannedCourses.indexOf course
    @removeCredits(course)
    plannedCourses = React.addons.update(@state.plannedCourses, { $splice: [[index, 1]] })
    course.id = course.id / 10000

    # This needs to be added at the right index
    courses = React.addons.update(@state.courses, { $splice: [[course.index, 1, course]] })
    # new_courses = React.addons.update(@state.courses, { $push: [course] })
    @setState plannedCourses: plannedCourses
    @setState courses: courses

  changeQuarter: (course) ->
    courseIndex = @state.plannedCourses.indexOf course
    plannedCourses = @state.plannedCourses
    currentQuarterIndex = (course.available_quarters.indexOf course.selectedQuarter)
    newQuarterIndex = currentQuarterIndex + 1
    if newQuarterIndex > course.available_quarters.length - 1
        newQuarterIndex = 0
        newYear = if course.selectedYear == 5 then 4 else 5
        course.selectedYear = newYear
    course.selectedQuarter = course.available_quarters[newQuarterIndex]
    plannedCourses[courseIndex] = course
    @setState plannedCourses: plannedCourses

  updateCourse: (course, data) ->
    index = @state.courses.indexOf course
    courses = React.addons.update(@state.courses, { $splice: [[index, 1, data]] })
    @replaceState courses: courses

  render: ->
    courses = @filterCoursesp()
    React.DOM.div
        className: 'well'
        React.DOM.div
            className: 'row'
            React.DOM.table
                className: 'well table'
                React.DOM.thead null,
                  React.DOM.tr null,
                    React.DOM.th id: 'year-col'
                    React.DOM.th null, 'LP1'
                    React.DOM.th null, 'LP2'
                    React.DOM.th null, 'LP3'
                    React.DOM.th null, 'LP4',
                React.createElement SchoolYear, localStorageKey: 4, plannedCourses: @state.plannedCourses, year: 4, handleChangeQuarter: @changeQuarter, handleRemoveCourse: @removeCourse
                React.createElement SchoolYear, localStorageKey: 5, plannedCourses: @state.plannedCourses, year: 5, handleChangeQuarter: @changeQuarter, handleRemoveCourse: @removeCourse
            React.createElement CourseList, localStorageKey: 6, courses: courses, specialisations: @state.specialisations, handleAddCourse: @addCourse, handleAdvancedSwitch: @advancedSwitch, handleSelectSpec: @selectSpec, handleQuarterSelect: @selectQuarters, handleSearch: @search
            React.createElement CreditsBox, localStorageKey: 7, credits: @state.credits

        React.createElement Alert, handleDismissAlert: @dismissAlert if @state.showAlert
