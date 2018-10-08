import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { Form, FormGroup, Label, Input, Button } from 'reactstrap'
import axios from 'axios'
import Moment from 'moment';



class ShippingAddresses extends Component {
  constructor () {
    super()
    this.state = {
      
    	 streetandnumber: '', 
         city: '', 
         state: '', 
         zipcode: '', 
         country: '',
         idcustomer: '',
         shippingaddresses:[{}]
    }

  //  this.onSubmit = this.onSubmit.bind(this)
  }

  onDelete (e, id) {
    e.preventDefault()
    if (window.confirm('Are you sure to delete: ' + id + '?')) {
      // delete
      axios.delete('/shippingaddresses/' + id)
      .then(() => {
    	  // navigate to shippingaddresses list
    	  this.loadShippingAddresses()
    	  window.confirm('done')
    	  this.props.history.push('/shippingaddresses')
      })
    }
  }
/*
  onSubmit () {
    const {  streetandnumber, city, state, zipcode, country, idcustomer} = this.state

    // save
    // axios.get('http://example.com/movies.json')
    //   .then(function (response) {

    //   })
  }
*/
  componentDidMount () {
    // load shippingaddresses
    this.loadShippingAddresses()
  }
  
  loadShippingAddresses() {
	// load shippingaddresses
	    return axios.get('/shippingaddresses') ///axios llamasat http
	      .then((result) => {
	        this.setState({shippingaddresses: result.data})
	      })
  }

  render () {
    const { shippingaddresses } = this.state
    Moment.locale('en');
    return (
      <div className='shippingaddresses'>
        <div>
          <h3>List ShippingAddresses <Link to='/shippingaddresses/new' className='btn btn-primary'>New</Link></h3>
          <div className='row'>
            <div className='col-md-3'>streetandnumber</div>
            <div className='col-md-3'>city</div>
            <div className='col-md-3'>Customer</div>
            <div className='col-md-3'>Actions</div>   
            </div>
          {shippingaddresses.map((shippingaddress, i) =>
            <div className='row' key={i}>
              <div className='col-md-3'>{shippingaddress.streetandnumber}</div>
              <div className='col-md-3'>{shippingaddress.city}</div>
              <div className='col-md-3'>{shippingaddress.name}</div>
              <div className='col-md-3'>
             
              <a href={'/shippingaddresses/edit/' + shippingaddress.id}>Edit</a>
              <a href='' onClick={(e) => this.onDelete(e, shippingaddress.id)}>Delete</a>
              </div>
            </div>
          )}
        </div>
      </div>
    )
  }
}

export default ShippingAddresses
