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
      address: '',

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
      //   axios.get('http://example.com/movies.json')
      //   .then(function (response) {
      window.confirm('done')
      // navigate to customers list
      this.props.history.push('/customers')
    }
  }

  onSubmit () {
    const { name, phone, email, address } = this.state

    // save
    // axios.get('http://example.com/movies.json')
    //   .then(function (response) {

    //   })
  }

  componentWillMount () {
    // load customers
    axios.get('http://localhost:3000/customers')
      .then((result) => {
        console.log(result)
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
                <Link to={'/customers/edit/' + customer.id}>Edit</Link>
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
