@PlannedCourses = React.createClass
  getInitialState: ->
    plannedCourses: @props.data
    credits: {spec: 0, adv: 0, advSpec: 0, total: 0}

  getDefaultProps: ->
    plannedCourses: []
    credits: {spec: 0, adv: 0, advSpec: 0, total: 0}

  addCourse: (course) ->
    plannedCourses = React.addons.update(@state.plannedCourses, { $push: [course] })
    @setState plannedCourses: plannedCourses

  deleteCourse: (course) ->
    index = @state.plannedCourses.indexOf course
    plannedCourses = React.addons.update(@state.plannedCourses, { $splice: [[index, 1]] })
    @replaceState plannedCourses: plannedCourses

  updateCourse: (course, data) ->
    index = @state.plannedCourses.indexOf course
    plannedCourses = React.addons.update(@state.plannedCourses, { $splice: [[index, 1, data]] })
    @replaceState plannedCourses: plannedCourses

  render: ->
    React.DOM.div
        className: 'well'
        React.DOM.div
          className: 'planned-courses'
          React.DOM.h2
            className: 'title'
            'Planned Courses'
          React.DOM.div
            className: 'row'
          React.DOM.hr null
          React.DOM.table
            className: 'table table-bordered'
            React.DOM.thead null,
              React.DOM.tr null,
                React.DOM.th id: 'year-col', 'Year'
                React.DOM.th null, 'LP1'
                React.DOM.th null, 'LP2'
                React.DOM.th null, 'LP3'
                React.DOM.th null, 'LP4'
            React.DOM.tbody null,
                React.createElement SchoolYear, key: 1, courses: [], year: 1
                React.createElement SchoolYear, key: 2, courses: [], year: 2
        React.DOM.div
            className: 'container course-credits'
            React.createElement CourseList, courses: @state.plannedCourses
            React.createElement CreditsBox, credits: @state.credits