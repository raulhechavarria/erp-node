
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
      customers:[],
      customer:{}
      
    }
    this.onSubmit = this.onSubmit.bind(this)
  }
  

  componentDidMount () {
	 this.loadShippingAddress()
	 this.loadCustomer()
	 }
  


  loadCustomer() {
		// load customers
	  const idcustomer = this.state.idcustomer 
		    return axios.get('/customers/' + idcustomer) ///axios llamasat http
		      .then((result) => {
			        this.setState({customer: result.data})		    	
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
    const sa = {
      id,   
      idcustomer: idcustomer,
      streetandnumber, 
      city, 
      state, 
      zipcode, 
      country
    }

    if (!id) {
      // create new
      axios.post('/shippingaddresses', sa)
        .then(function (response) {
        	alert(response.data.message)
        })
    } else {
      // update
      axios.put('/shippingaddresses', sa)
        .then(function (response) {
        	alert(response.data.message)
        })
    }
    window.location.reload();
    this.props.history.push('/shippingaddresses')
  }

  render () {
    let { idcustomer, customer,  streetandnumber, city, state, zipcode, country } = this.state
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
	        <Input type='text' name={customer.name} id='idcustomer' value={idcustomer}  />
      </FormGroup>
	       
          <Button color='primary' onClick={this.onSubmit}>Submit</Button>
          <Button onClick={() => this.props.history.push('/shippingaddresses')}>Cancel</Button>
        </Form>
      </div>
    )
  }
}

export default OrderForm
