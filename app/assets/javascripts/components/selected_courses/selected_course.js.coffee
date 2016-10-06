LEFT_BUTTON = 0
DRAG_THRESHOLD = 3 # pixels

@SelectedCourse = React.createClass
    displayName: "selected_course"
    getInitialState: ->
        mouseDown: false
        dragging: false
    removeCourse: ->
        @props.handleRemoveCourse @props.course
    changeQuarter: ->
        @props.handleChangeQuarter @props.course
    dragData: ->
        course: @props.course
    style: ->
        if @state.dragging
            position: 'absolute'
            left: @state.left
            top: @state.top
        else
            {}
    render: ->
        React.DOM.div
            className: "course-div " + "quarters-#{@props.course.quarters.length}"
            onMouseDown: @onMouseDown
            React.DOM.a
                onClick: @removeCourse
                className: "hidden-element" if @props.course.notClosable
                React.createElement ReactBootstrap.Glyphicon,
                    glyph: "remove-circle"
            React.createElement ReactBootstrap.Button,
                style: @style()
                bsStyle: "primary"
                className: "selected-course" + " dnd-draggable #{'dragging' if @state.dragging} " + "dnd-source-object #{@props.type}"
                React.DOM.div
                    className: 'row'
                    React.DOM.div
                        className: 'course-id col-md-6 col-sm-6 col-xs-6'
                        "#{@props.course.course_code}"
                    React.DOM.div
                        className: 'course-credits col-md-6 col-sm-6 col-xs-6'
                        "#{@props.course.credits} hp  "
                React.DOM.div
                    className: 'row'
                    React.DOM.div
                        className: 'course-name col-md-12 col-sm-12'
                        @props.course.course_name

    onMouseDown: (event) ->
        if event.button == LEFT_BUTTON
          event.stopPropagation()
          @addEvents()
          pageOffset = @getDOMNode().getBoundingClientRect()
          @setState
            mouseDown: true
            originX: event.pageX
            originY: event.pageY

    onMouseMove: (event) ->
        deltaX = event.pageX - @state.originX
        deltaY = event.pageY - @state.originY
        distance = Math.abs(deltaX) + Math.abs(deltaY)

        if !@state.dragging and distance > DRAG_THRESHOLD
          @setState dragging: true
          @props.onDragStart? @dragData?()

        if @state.dragging
          @setState
            left: deltaX + document.body.scrollLeft
            top:  deltaY + document.body.scrollTop

    onMouseUp: ->
        @removeEvents()
        if @state.dragging
          @props.onDragStop()
          @setState dragging: false

    addEvents: ->
        document.addEventListener 'mousemove', @onMouseMove
        document.addEventListener 'mouseup', @onMouseUp

    removeEvents: ->
        document.removeEventListener 'mousemove', @onMouseMove
        document.removeEventListener 'mouseup', @onMouseUp
