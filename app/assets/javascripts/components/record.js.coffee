@Record = React.createClass
    getInitialState: ->
        edit: false
    handleDelete: (e) ->
        e.preventDefault()
        $.ajax
        method: 'DELETE'
        url: "/records/#{ @props.record.id }"
        dataType: 'JSON'
        success: () =>
            @props.handleDeleteRecord @props.record
    recordRow: ->
        React.DOM.tr null,
            React.DOM.td null, @props.record.title
            React.DOM.td null, @props.record.title
            React.DOM.td null, amountFormat(@props.record.amount)
            React.DOM.td null,
                React.DOM.a
                    className: 'btn btn-default'
                    onClick: @handleToggle
                    'Edit'
                React.DOM.a
                    className: 'btn btn-danger'
                    onClick: @handleDelete
                    'Delete'
    render: ->
            @recordRow()