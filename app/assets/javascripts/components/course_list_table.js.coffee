@CourseListTable = React.createClass
    handleAdd: ->
        console.log("hej")
    render: ->
        React.createElement ReactBootstrap.Table ,
            striped: true
            condensed: true
            hover: true
            React.DOM.thead null,
                React.DOM.tr null,
                    React.DOM.th null, 'Name'
                    React.DOM.th null, 'Code'
                    React.DOM.th null, 'HP/Adv/Spec'
                    React.DOM.th null, 'Quarters'
                    React.DOM.th id: "add-link", ''
            React.DOM.tbody id:"courselist-tbody",
                React.DOM.td null, "Kravhantering"
                React.DOM.td null, "ETS170"
                React.DOM.td null, "7,5/A/Anv"
                React.DOM.td className: "quarters",
                    React.DOM.span
                        className:"label label-default"
                        1
                    React.DOM.span
                        className:"label label-default"
                        2
                    React.DOM.span
                        className:"label label-default"
                        3
                    React.DOM.span
                        className:"label label-default"
                        4
                React.DOM.td id: "add-link",
                    React.DOM.a
                        className: "add"
                        onClick: @handleAdd
                        React.createElement ReactBootstrap.Glyphicon,
                            glyph: "plus-sign"

