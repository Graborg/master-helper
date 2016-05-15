@Search = React.createClass
    getInitialState: ->
      value: ''

    handleChange: (e) ->
      name = e.target.name
      @props.handleSearch e
      @setState "#{ name }": e.target.value

    render: ->
        React.createElement ReactBootstrap.Input,
            type: "text"
            placeholder:"Search "
            value: @state.title
            onChange: @handleChange
            bsStyle: "success"
            ref: "input"
            groupClassName: "group-class"
            labelClassName: "label-class"
