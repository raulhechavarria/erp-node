import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { Form, FormGroup, Label, Input, Button } from 'reactstrap'
import axios from 'axios'

class Orders extends Component {
  constructor () {
    super()
    this.state = {
      
      numberorder: '',
      date: '' ,
      idcustomer: '' ,
      paymenttype: '',
      

      orders: [{
        id: 1,
        name: 'fan',
        description: 3213213
      }]
    }

    this.onSubmit = this.onSubmit.bind(this)
  }

  onDelete (e, id) {
    e.preventDefault()
    if (window.confirm('Are you sure to delete: ' + id + '?')) {
      // delete
      axios.delete('http://localhost:3001/orders/' + id)
      .then(() => {
    	  // navigate to orders list
    	  this.loadOrders()
    	  window.confirm('done')
    	  this.props.history.push('/orders')
      })
    }
  }

  onSubmit () {
    const { numberorder, date, idcustomer, paymenttype} = this.state

    // save
    // axios.get('http://example.com/movies.json')
    //   .then(function (response) {

    //   })
  }

  componentDidMount () {
    // load orders
    this.loadOrders()
  }
  
  loadOrders() {
	// load orders
	    return axios.get('http://localhost:3001/orders') ///axios llamasat http
	      .then((result) => {
	        this.setState({orders: result.data})
	      })
  }

  render () {
    const { orders } = this.state
    return (
      <div className='orders'>
        <div>
          <h3>List Orders <Link to='/orders/new' className='btn btn-primary'>New</Link></h3>
          <div className='row'>
            <div className='col-md-3'>numberorder</div>
            <div className='col-md-3'>Date</div>
            <div className='col-md-3'>Actions</div>   
          </div>
          {orders.map((order, i) =>
            <div className='row' key={i}>
              <div className='col-md-3'>{order.numberorder}</div>
              <div className='col-md-3'>
 {order.date}            
              </div>
              <div className='col-md-3'>
              
                <a href='' onClick={(e) => this.onDelete(e, order.id)}>Delete</a>
              </div>
            </div>
          )}
        </div>
      </div>
    )
  }
}

export default Orders
