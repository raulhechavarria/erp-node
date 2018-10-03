import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { Form, FormGroup, Label, Input, Button } from 'reactstrap'
import axios from 'axios'

class Customers extends Component {
  constructor () {
    super()
    this.state = {
      name: '',
      phone: '',
      email: '',
      streetandnumber: '', 
      city: '', 
      state: '', 
      zipcode: '', 
      country: '',

      customers: [{
        id: 1,
        name: 'John Milot',
        phone: 3213213
      }]
    }

    this.onSubmit = this.onSubmit.bind(this)
  }

  onDelete (e, id) {
    e.preventDefault()
    if (window.confirm('Are you sure to delete: ' + id + '?')) {
      // delete
      axios.delete('http://localhost:3001/customers/' + id)
      .then(() => {
    	  // navigate to customers list
    	  this.loadCustomers()
    	  window.confirm('done')
    	  this.props.history.push('/customers')
      })
    }
  }

  onSubmit () {
    const { name, phone, email, streetandnumber, city, state, zipcode, country } = this.state

    // save
    // axios.get('http://example.com/movies.json')
    //   .then(function (response) {

    //   })
  }
 
  componentDidMount () {
    // load customers
    this.loadCustomers()
  }
  
  loadCustomers() {
	// load customers
	    return axios.get('http://localhost:3001/customers') ///axios llamasat http
	      .then((result) => {
	        this.setState({customers: result.data})
	      })
  }

  render () {
    const { customers } = this.state
    return (
      <div className='customers'>
        <div>
          <h3>List Customers <Link to='/customers/new' className='btn btn-primary'>New</Link></h3>
          <div className='row'>
            <div className='col-md-3'>Name</div>
            <div className='col-md-3'>Phone</div>
            <div className='col-md-3'>Actions</div>
          </div>
          {customers.map((customer, i) =>
            <div className='row' key={i}>
              <div className='col-md-3'>{customer.name}</div>
              <div className='col-md-3'>{customer.phone}</div>
              <div className='col-md-3'>
                <a href={'/customers/edit/' + customer.id}>Edit</a>
                <a href='' onClick={(e) => this.onDelete(e, customer.id)}>Delete</a>
              </div>
            </div>
          )}
        </div>
      </div>
    )
  }
}

export default Customers
//export loadCustomers
