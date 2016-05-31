var React = require('react');
var ReactDOM = require('react-dom');
//Router
var ReactRouter = require('react-router');
var Router = ReactRouter.Router;
var Route = ReactRouter.Route;
var IndexRoute = ReactRouter.IndexRoute;
var hashHistory = ReactRouter.hashHistory;

var SessionStore = require("./stores/SessionStore");
var SessionActions = require("./actions/SessionActions");

var SessionApiUtil = require('./util/sessionApiUtil');

var Test = React.createClass({
  render: function(){
    return(
      <div>
        Hello World
      </div>
    );
  }
});

var Router = (
  <Router history={hashHistory}>
    <Route path="/" component={Test}/>
  </Router>
);

window.SessionApiUtil = SessionApiUtil;
window.SessionStore = SessionStore;
window.SessionActions = SessionActions;

document.addEventListener('DOMContentLoaded', function(){
  var root = document.getElementById('content');
  ReactDOM.render(Router, root);
});