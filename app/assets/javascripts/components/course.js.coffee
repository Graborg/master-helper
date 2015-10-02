@Course = React.createClass
    render: ->
         React.DOM.div
            className: 'test'
            React.DOM.a
                className: 'btn btn-primary course-btn container    '
                React.DOM.div
                    className: 'row'
                    React.DOM.div
                        className: 'course-id col-md-6 col-sm-6 col-xs-6'
                        "#{@props.course.course_id}"
                    React.DOM.div
                        className: 'course-credits col-md-6 col-sm-6 col-xs-6'
                        "#{@props.course.credits} hp"
                React.DOM.div
                    className: 'row'
                    React.DOM.div
                        className: 'course-name col-md-12 col-sm-12'
                        @props.course.course_name
