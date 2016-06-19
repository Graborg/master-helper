// Setup app into global name space for server rendering
React = require('react');
ReactDnD = require('react-dnd');

var app = window.app = global.app = {};

// Component::Manifest
var Board = require('./components/testdragndrop/board.js');

// Include into app namespace
app.Board = Board;
