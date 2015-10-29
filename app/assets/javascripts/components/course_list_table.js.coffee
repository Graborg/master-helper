@CourseListTable = React.createClass
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
            React.DOM.tbody id:"courselist-tbody",
                for course in @props.courses
                    React.createElement CourseListRow, key: course.id, course: course, handleAddCourse: @props.handleAddCourse
