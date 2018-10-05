
import React, { Component } from 'react'
import { Form, FormGroup, Label, Input, Button } from 'reactstrap'
import axios from 'axios'

/*
const Hello = () => {
	return <a className="btn btn-danger">helhloo</a>
}
*/
class CustomerForm extends Component {
  constructor (props) {
    super(props)
    this.state = {
      name: '',
      phone: '',
      email: '',
      streetandnumber: '',
      city:  '',
      state: '',
      zipcode: '',
      country: ''
    }

    this.onSubmit = this.onSubmit.bind(this)
    this.loadCustomer = this.loadCustomer.bind(this)
    }

  componentDidMount () {
	 this.loadCustomer()
  }
  
  loadCustomer() {
    const { match } = this.props
    const id = match.params.id
    if (id) {
      // load the customer data
    	axios.get('http://localhost:3001/customers/' + id)
        .then((result) => {
    	  let customer = result.data
      	  this.setState({
      		 name: customer.name || '',
             phone: customer.phone || '',
             email: customer.email || '',
             streetandnumber: customer.streetandnumber|| '',
             city: customer.city|| '',
             state: customer.state|| '',
             zipcode: customer.zipcode|| '',
             country: customer.country|| ''
      	  })
        }) 
    }
  }

  onSubmit () {
    const { name, phone, email, streetandnumber, city, state, zipcode, country } = this.state
    const { match } = this.props
    const id = match.params.id

    const customer = {
      id,
      name,
      phone,
      email,
      streetandnumber, 
      city, 
      state, 
      zipcode, 
      country
    }

    if (!id) {
      // create new
      axios.post('http://localhost:3001/customers', customer)
        .then(function (response) {
        	
        })
    } else {
      // update
      axios.put('http://localhost:3001/customers', customer)
        .then(function (response) {

        })
    }
    this.props.history.push('/customers')
  }
  
  

  render () {
    const { name, phone, email, streetandnumber, city, state, zipcode, country } = this.state
    const { match } = this.props

    return (
      <div>
        <h3>Customer Data Id:{match.params.id}</h3>
        <Form>
          <FormGroup>
            <Label for='name'>Name</Label>
            <Input type='text' name='name'  id='name' value={name} onChange={(e) => this.setState({ name: e.target.value })} />
          </FormGroup>
          <FormGroup>
            <Label for='phone'>Phone</Label>
            <Input type='text' name='phone' id='phone' value={phone} onChange={(e) => this.setState({ phone: e.target.value })} />
          </FormGroup>
            <FormGroup>
            <Label for='email'>Email</Label>
            <Input type='email' name='email' id='email' value={email} onChange={(e) => this.setState({ email: e.target.value })} />
          </FormGroup>
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
          
            <Button color='primary' onClick={this.onSubmit}>Primary</Button>
          <Button onClick={() => this.props.history.push('/customers')}>Cancel</Button>
        </Form>
      </div>
    )
  }
}

export default CustomerForm
