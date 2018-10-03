
import React, { Component } from 'react'
import { Form, FormGroup, Label, Input, Button } from 'reactstrap'
import axios from 'axios'
import Select from 'react-select';

//import {loadCustomers} from '/Customer/Customers'
class OrderForm extends Component {
  constructor () {
    super()
    this.state = {
      numberorder: '', 
      date: '', 
      idcustomer: '', 
      paymenttype: '',
      customers : [],
      
      products : [],
      selectedproducts:[]
      
    }
    this.onSubmit = this.onSubmit.bind(this)
  }
  

  componentDidMount () {
	 this.loadOrder()
	 this.loadCustomers()
	 this.loadProducts()
	 
  }
  
  loadProducts() {
		    return axios.get('http://localhost:3001/products') ///axios llamasat http
		    .then((result) => {
	        this.setState({products: result.data})
	      })
  }
  
  
  loadCustomers() {
		// load customers
		    return axios.get('http://localhost:3001/customers') ///axios llamasat http
		      .then((result) => {
			        this.setState({customers: result.data})		    	
		      })
  }
  
  
  loadOrder() {
    const { match } = this.props
    const id = match.params.id
    if (id) {
      // load the order data
    	axios.get('http://localhost:3001/orders/' + id)
        .then((result) => {
    	  let order = result.data
      	  this.setState({
      		numberorder: order.numberorder || '',
      		date: order.date || '',
             idcustomer: order.idcustomer || '',
             paymenttype: order.paymenttype || ''
      	  })
        }) 
    }
  }

  onSubmit () {
	  

    const { numberorder, date, idcustomer, paymenttype,  selectedproducts } = this.state
  //  console.log(selectedproducts)
    const { match } = this.props
    const id = match.params.id

    const order = {
      id,
      numberorder,
      date,
      idcustomer,
      paymenttype,
      products: selectedproducts
    }

    if (!id) {
      // create new
      axios.post('http://localhost:3001/orders', order)
        .then(function (response) {
        	
        })
    } else {
      // update
      axios.put('http://localhost:3001/orders', order)
        .then(function (response) {

        })
    }
    this.props.history.push('/orders')
  }

  render () {
    const { numberorder, date, idcustomer, paymenttype } = this.state
    const { match } = this.props

    return (
      <div>
        <h3>Order Data Id:{match.params.id}</h3>
        <Form>
          <FormGroup>   
            <Label for='numberorder'>Order Number</Label>
            <Input type='text' name='numberorder' value={numberorder} id='numberorder'  onChange={(e) => this.setState({ numberorder: e.target.value })}/>
          </FormGroup>
          
            <FormGroup>
            <Label for='date'>date</Label>
            
            <input type="date" name='date' id='date'
            	value={date} onChange={(e) => this.setState({ date: e.target.value })}
                min="2018-01-01" max="2020-12-31"/ >
            
          </FormGroup>
            
            <FormGroup>
            <Label for='idcustomer'>Customer</Label>
            
            <select name='idcustomer' id='idcustomer' value={idcustomer} onChange={(e) => this.setState({ idcustomer: e.target.value })}>
            
	            {this.state.customers.map((customer, i) =>
	            <option value={customer.id}>{customer.name}</option>
	            )}
	            
           </select>
          </FormGroup>
          
          <FormGroup>
          <Label for='idproduct'>Product</Label>
          <Select isMulti  onChange={(e) => this.setState({ selectedproducts: e })}  options={this.state.products} />
          </FormGroup>  
          
          <FormGroup>
            <Label for='paymenttype'>Price</Label>
            <Input type='text' name='paymenttype' id='paymenttype' value={paymenttype} onChange={(e) => this.setState({ paymenttype: e.target.value })} />
          </FormGroup>
            
          
          
          <Button color='primary' onClick={this.onSubmit}>Submit</Button>
          <Button onClick={() => this.props.history.push('/orders')}>Cancel</Button>
        </Form>
      </div>
    )
  }
}

export default OrderForm
