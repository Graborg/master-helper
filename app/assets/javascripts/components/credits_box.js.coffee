@CreditsBox = React.createClass
    render: ->
      React.DOM.div
        className: 'col-md-4 col-lg-4 col-xs-4 col-sm-4 credits-box'
        React.DOM.div
          className: "panel panel-#{ @props.type }"
          React.DOM.div
            className: 'panel-heading'
            @props.text
          React.DOM.div
            className: 'panel-body'
            amountFormat(@props.amount)