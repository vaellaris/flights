// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import App from '../components/App'
import {BrowserRouter as Router, Route} from 'react-router-dom'


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Router>
      # set up an indirect path for any route that will point initially to our App component
      <Route path="/" components={App}/>
    </Router>,
    document.body.appendChild(document.createElement('div')),
  )
})