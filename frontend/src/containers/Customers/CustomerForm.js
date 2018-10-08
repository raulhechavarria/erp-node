
import React, { Component } from 'react'
import { Form, FormGroup, Label, Input, Button, Row, Col  } from 'reactstrap'
import axios from 'axios'
import Select from 'react-select'
import DataTable from 'react-data-table-component'

//import {BootstrapTable, TableHeaderColumn} from 'react-bootstrap-table';
//with es5
var ReactBsTable = require('react-bootstrap-table');
var BootstrapTable = ReactBsTable.BootstrapTable;
var TableHeaderColumn = ReactBsTable.TableHeaderColumn;
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
      country: '',
      
      streetandnumber1: '',
      city1:  '',
      state1: '',
      zipcode1: '',
      country1: '',
      shippingAddresses:[]
      
    }

    this.onSubmit = this.onSubmit.bind(this)
    this.onSubmitShippingAddress = this.onSubmitShippingAddress.bind(this)
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
    	axios.get('/customers/' + id)
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

  onSubmitShippingAddress () {
	    const {streetandnumber1, city1, state1, zipcode1, country1} = this.state
	    const ShippingAddr = {
	    		id : Math.floor(Math.random() * Math.floor(1000)),
	    		streetandnumber1,
	    	      city1 ,
	    	      state1 ,
	    	      zipcode1 ,
	    	      country1 
	    	    }
	   
	    this.setState({shippingAddresses: this.state.shippingAddresses.concat(ShippingAddr)})
	 }

  
  onSubmit () {
    const {shippingAddresses, name, phone, email, streetandnumber, city, state, zipcode, country } = this.state
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
      country,
      shippingAddresses
    }
    let idcust;
    if (!id) {
      // create new
      axios.post('/customers', customer)
        .then(function (response) {
        //	idcust = response.data.id
        	alert(response.data.message)
        	//  this.loadCustomers()
        })
    } else {
      // update
      axios.put('/customers', customer)
        .then(function (response) {
        	alert(response.data.message)
      	//  this.loadCustomers()
        })
    }
    window.location.reload();
    this.props.history.push('/customers')
  }
  
  

  render () {
    const {shippingAddresses, name, phone, email, streetandnumber, city, state, zipcode, country,streetandnumber1, city1, state1, zipcode1, country1 } = this.state
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

		          <Label for='idShippingAddress'>Shipping Addresses</Label>
		          <Row>
			          <Col><Label for='streetandnumber1'>streetandnumber1</Label><Input type='text' id='streetandnumber1' value={streetandnumber1}   onChange={(e) => this.setState({ streetandnumber1: e.target.value })}/></Col>
			          <Col><Label for='city1'>city</Label><Input type='city' name='city1' id='city1' value={city1}   onChange={(e) => this.setState({ city1: e.target.value })}/></Col>
			          <Col><Label for='state1'>state</Label><Input type='state' id='state1' value={state1}   onChange={(e) => this.setState({ state1: e.target.value })}/></Col>
			      </Row>
			      <Row>
			          <Col><Label for='zipcode1'>zipcode</Label><Input type='zipcode' name='zipcode1' id='zipcode1' value={zipcode1}   onChange={(e) => this.setState({ zipcode1: e.target.value })}/></Col>
			          <Col><Label for='country1'>country</Label><Input type='country' name='country1' id='country1' value={country1}   onChange={(e) => this.setState({ country1: e.target.value })}/></Col>
			          <Col><Button color='primary' onClick={this.onSubmitShippingAddress}> Submit Shipping Addres</Button></Col>
		          </Row>
		          <BootstrapTable data={shippingAddresses} striped hover>
			          <TableHeaderColumn isKey dataField='id'>shippingAddresses ID</TableHeaderColumn>
			          <TableHeaderColumn dataField='streetandnumber1'>streetandnumber</TableHeaderColumn>
			          <TableHeaderColumn dataField='zipcode1'>zipcode</TableHeaderColumn>
			      </BootstrapTable>
	              
            </FormGroup>
            
          
            <Button color='primary' onClick={this.onSubmit}>Submit</Button>
          <Button onClick={() => this.props.history.push('/customers')}>Cancel</Button>
        </Form>
      </div>
    )
  }
}

export default CustomerForm
