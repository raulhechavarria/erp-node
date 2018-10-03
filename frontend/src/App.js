import React, { Component } from 'react'
import './App.css'
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'

import Home from './containers/Home/Home'
import Customers from './containers/Customers/Customers'
import Products from './containers/Products/Products'
import Orders from './containers/Orders/Orders'

import CustomerForm from './containers/Customers/CustomerForm'
import ProductForm from './containers/Products/ProductForm'
import OrderForm from './containers/Orders/OrderForm'

class App extends Component {
  render () {
    return (
      <Router>
        <div className='Appcontainer'>
          <ul>
            <li>
              <Link to='/'>Home</Link>
            </li>
            <li>
              <Link to='/customers'>Customers</Link>
            </li>
            <li>
              <Link to='/products'>Products</Link>
            </li>
            <li>
              <Link to='/orders'>Orders</Link>
            </li>
          </ul>

          <hr />
          <div className='row'>
            <div className='col-md-6'>
              <Route exact path='/' component={Home} />
              <Route path='/customers' component={Customers} />
              <Route path='/products' component={Products} />
              <Route path='/orders' component={Orders} />
            </div>
            <div className='col-md-6'>
              <Route path='/customers/new' component={CustomerForm} />
              <Route path='/customers/edit/:id' component={CustomerForm} />
            </div>
              <div className='col-md-6'>
              <Route path='/products/new' component={ProductForm} />
              <Route path='/products/edit/:id' component={ProductForm} />
            </div>  
              <div className='col-md-6'>
              <Route path='/orders/new' component={OrderForm} />
              <Route path='/orders/edit/:id' component={OrderForm} />
            </div>  
          </div>
        </div>
      </Router>
    )
  }
}

export default App
