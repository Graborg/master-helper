@CreditsBox = React.createClass
    render: ->
      React.DOM.div
        className: 'col-md-4 col-lg-4 col-xs-4 col-sm-4 credits-box'
        React.DOM.div
          className: "panel panel-primary"
          React.DOM.div
            className: 'panel-heading'
            "Credits"
          React.DOM.div
            className: 'container credits-box-container panel-body'
            React.DOM.div
                className: 'row'
                React.DOM.div
                    className: 'col-md-12 col-lg-12 col-xs-12 col-sm-12'
                    React.DOM.span
                        className: "pull-left"
                        "Specialisation"
                    React.DOM.span
                        className: "pull-right"
                        "5/45 hp"
            React.DOM.div
                className: 'row'
                React.DOM.div
                    className: 'col-md-12 col-lg-12 col-xs-12 col-sm-12'
                    React.createElement ReactBootstrap.ProgressBar,
                        now:20
            React.DOM.div
                className: 'row'
                React.DOM.div
                    className: 'col-md-12 col-lg-12 col-xs-12 col-sm-12'
                    React.DOM.span
                        className: "pull-left"
                        "Advanced"
                    React.DOM.span
                        className: "pull-right"
                        "5/75 hp"
            React.DOM.div
                className: 'row'
                React.DOM.div
                    className: 'col-md-12 col-lg-12 col-xs-12 col-sm-12'
                    React.createElement ReactBootstrap.ProgressBar,
                        now:20
            React.DOM.div
                className: 'row'
                React.DOM.div
                    className: 'col-md-12 col-lg-12 col-xs-12 col-sm-12'
                    React.DOM.span
                        className: "pull-left"
                        "Advanced in specialisation"
                    React.DOM.span
                        className: "pull-right"
                        "5/30 hp"
            React.DOM.div
                className: 'row'
                React.DOM.div
                    className: 'col-md-12 col-lg-12 col-xs-12 col-sm-12'
                    React.createElement ReactBootstrap.ProgressBar,
                        now:20
            React.DOM.div
                id:"total-row"
                className: 'row'
                React.DOM.div
                    className: 'col-md-12 col-lg-12 col-xs-12 col-sm-12'
                    React.DOM.span
                        className: " pull-left"
                        "Total"
                    React.DOM.span
                        className: "pull-right"
                        "5/120 hp"
            React.DOM.div
                className: 'row'
                React.DOM.div
                    className: 'col-md-12 col-lg-12 col-xs-12 col-sm-12'
                    React.createElement ReactBootstrap.ProgressBar,
                        now:5


