@PlannedCourses = React.createClass
  getInitialState: ->
    plannedCourses: @props.data

  getDefaultProps: ->
    plannedCourses: []

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
            # React.createElement CreditBox, type: 'success', amount: 5, text: 'Credits'
          # React.createElement RecordForm, handleNewRecord: @addRecord
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
                React.createElement SchoolYear, key: 1, courses: @state.plannedCourses, year: 1
                React.createElement SchoolYear, key: 2, courses: @state.plannedCourses, year: 2