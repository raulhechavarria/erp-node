
import React, { Component } from 'react'
import { Form, FormGroup, Label, Input, Button } from 'reactstrap'
import axios from 'axios'
import Select from 'react-select';

//import {loadCustomers} from '/Customer/Customers'
class OrderForm extends Component {
  constructor () {
    super()
    this.state = {
      idcustomer: '', 
      streetandnumber: '',
      city:  '',
      state: '',
      zipcode: '',
      country: '',
      customers:[]
      
    }
    this.onSubmit = this.onSubmit.bind(this)
  }
  

  componentDidMount () {
	 this.loadCustomers() 
	 this.loadShippingAddress() 
	 }
  
  loadCustomers() {
		// load customers
		    return axios.get('/customers') ///axios llamasat http
		      .then((result) => {
			        this.setState({customers: result.data})		    	
		      })
}
  
  loadShippingAddress() {
	    const { match } = this.props
	    const id = match.params.id  // take parameter url
	    if (id) {
	      // load the order data
	    	axios.get('/shippingaddresses/' + id)
	        .then((result) => {
	    	  let shippingadd = result.data 
	      	  this.setState({
	             idcustomer: shippingadd.idcustomer || '',
	             streetandnumber: shippingadd.streetandnumber|| '',
	             city: shippingadd.city|| '',
	             state: shippingadd.state|| '',
	             zipcode: shippingadd.zipcode|| '',
	             country: shippingadd.country|| ''
	      	  })
	      	  
	      	  
	        });    	
	    }
	  }
  
  

  onSubmit () {
    const {  idcustomer , streetandnumber, city, state, zipcode, country  } = this.state
    const { match } = this.props
    const id = match.params.id
    const order = {
      id,   
      idcustomer: idcustomer.value,
      streetandnumber, 
      city, 
      state, 
      zipcode, 
      country
    }

    if (!id) {
      // create new
      axios.post('/shippingaddresses', order)
        .then(function (response) {
        //	this.props.history.push('/shippingaddresses')
        })
    } else {
      // update
      axios.put('/shippingaddresses', order)
        .then(function (response) {
        //	this.props.history.push('/shippingaddresses')
        })
    }
    window.location.reload();
    this.props.history.push('/shippingaddresses')
  }

  render () {
    let { idcustomer,  streetandnumber, city, state, zipcode, country } = this.state
    const { match } = this.props

    return (
      <div>
        <h3>Order Data Id:{match.params.id}</h3>
        <Form>
        <FormGroup>
        <Label for='streetandnumber'>streetandnumber</Label>
        <Input type='streetandnumber' name='streetandnumber' id='streetandnumber' value={streetandnumber} onChange={(e) => this.setState({ streetandnumber: e.target.value })} />
      </FormGroup>
        <FormGroup>
        <Label for='city'>city</Label>
        <Input type='city' name='city' id='city' value={city} onChange={(e) => this.setState({ city: e.target.value })} />
      </FormGroup>
        <FormGroup>
        <Label for='state'>state</Label>
        <Input type='state' name='state' id='state' value={state} onChange={(e) => this.setState({ state: e.target.value })} />
      </FormGroup>
        <FormGroup>
        <Label for='zipcode'>zipcode</Label>
        <Input type='zipcode' name='zipcode' id='zipcode' value={zipcode} onChange={(e) => this.setState({ zipcode: e.target.value })} />
      </FormGroup>
      <FormGroup>
        <Label for='country'>country</Label>
        <Input type='country' name='country' id='country' value={country} onChange={(e) => this.setState({ country: e.target.value })} />
      </FormGroup>
          
        <FormGroup>
	        <Label for='idcustomer'>Customer</Label>
	        <Select onChange={(value) => this.setState({ idcustomer: value })}  options={this.state.customers.map(c => ({ label: c.name, value: c.id, name: c.name}))} />
      </FormGroup>
	       
          <Button color='primary' onClick={this.onSubmit}>Submit</Button>
          <Button onClick={() => this.props.history.push('/shippingaddresses')}>Cancel</Button>
        </Form>
      </div>
    )
  }
}

export default OrderForm
