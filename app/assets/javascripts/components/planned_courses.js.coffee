@PlannedCourses = React.createClass
  getInitialState: ->
    courses: @props.data
    plannedCourses: []
    credits: {spec: 0, adv: 0, advSpec: 0, total: 0}
    advanced: false
  getDefaultProps: ->
    courses: []
    plannedCourses: []
    credits: {spec: 0, adv: 0, advSpec: 0, total: 0}
  AdvancedSwitch: ->
    console.log "geh"
    @changeState advanced: !@state.advanced
  search: (searchString)->
    console.log searchString
  addCredits: (course) ->
    creditsHash = @state.credits
    if course.specialisation
        creditsHash.spec += course.credits
    if course.level == "Advanced"
        creditsHash.adv += course.credits
    if course.specialisation and course.level == "Advanced"
        creditsHash.advSpec += course.credits
    creditsHash.total += course.credits
    @setState credits: creditsHash

  addCourse: (course) ->
    index = @state.courses.indexOf course
    @addCredits(course)
    plannedCourse = {}
    for key of course
        plannedCourse[key] = course[key]
    plannedCourse.id = plannedCourse.id * 10000
    plannedCourse.selectedQuarter = plannedCourse.quarters[0]
    plannedCourse.selectedYear = 4
    plannedCourses = React.addons.update(@state.plannedCourses, { $push: [plannedCourse] })
    courses = React.addons.update(@state.courses, { $splice: [[index, 1]] })
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
    React.DOM.div
        className: 'well'
        React.DOM.div
            className: 'row'
            React.DOM.table
                className: 'table table-bordered'
                React.DOM.thead null,
                  React.DOM.tr null,
                    React.DOM.th id: 'year-col', 'Year'
                    React.DOM.th null, 'LP1'
                    React.DOM.th null, 'LP2'
                    React.DOM.th null, 'LP3'
                    React.DOM.th null, 'LP4'
                React.DOM.tbody id: "selectedCourses",
                    React.createElement SchoolYear, key: 1, plannedCourses: @state.plannedCourses, year: 4, handleChangeQuarter: @changeQuarter
                    React.createElement SchoolYear, key: 2, plannedCourses: @state.plannedCourses, year: 5, handleChangeQuarter: @changeQuarter
            React.DOM.div
                className: 'container course-credits'
            React.createElement CourseList, courses: @state.courses, handleAddCourse: @addCourse, handleAdvancedSwitch: @AdvancedSwitch, handleSearch: @search
            React.createElement CreditsBox, credits: @state.credits