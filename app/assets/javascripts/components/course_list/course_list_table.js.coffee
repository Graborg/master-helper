@CourseListTable = React.createClass
    displayName: "course_list_table"
    render: ->
        React.createElement ReactBootstrap.Table,
            striped: true
            condensed: true
            hover: true
            React.DOM.thead null,
                React.DOM.tr null,
                    React.DOM.th colSpan:"2", 'Name'
                    React.DOM.th null, 'Code'
                    React.DOM.th null, 'HP/Level/Spec'
                    React.DOM.th id:"quarter-header", 'Quarters'
                    React.DOM.th id: "add-link", ''
            React.DOM.tbody null,
                for course, i in @props.courses
                    React.createElement CourseListRow, key: course.course_code + i , course: course, handleAddCourse: @props.handleAddCourse
