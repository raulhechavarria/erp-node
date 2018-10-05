
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
	 this.setState({ numberorder : !this.state.numberorder ? '2018-' +  Math.floor(Math.random() * Math.floor(1000)) : this.state.numberorder}) 
	 this.setState({ date : !this.state.date ? '12-12-2009' : this.state.date}) 
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
    let { numberorder, date, idcustomer, paymenttype } = this.state
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
            <Input type="date" name='date' id='date' value={date} onChange={(e) => this.setState({ date: e.target.value })}
                min="2018-01-01" max="2020-12-31"/ >
          </FormGroup>
          
           <FormGroup>
           <Label for='idcustomer'>Customer</Label>
	          <Input type='select' name='idcustomer' id='idcustomer' value={idcustomer} onChange={(e) => this.setState({ idcustomer: e.target.value })}>
	          
	          {this.state.customers.map((customer, i) =>
	          <option key={customer.id} value={customer.id}>{customer.name}</option>
	          )}
	          
	          </Input>
	       </FormGroup>
	       
          <FormGroup>
          <Label for='idproduct'>Product</Label>
          <Select isMulti  onChange={(value) => this.setState({ selectedproducts: value })}  options={this.state.products} />
          </FormGroup>  
          
          <FormGroup>
	          <Label for='paymenttype'>Payment Type</Label>
	          <select  name='paymenttype' id='paymenttype' value={paymenttype} onChange={(e) => this.setState({ paymenttype: e.target.value })}>
		          <option value="Cash">Cash</option>
		          <option value="Credit Card">Credit Card</option>
		          <option value="Check">Check</option>
		          <option value="Other">Other</option>
	          </select>   
            </FormGroup>
            
          
          
          <Button color='primary' onClick={this.onSubmit}>Submit</Button>
          <Button onClick={() => this.props.history.push('/orders')}>Cancel</Button>
        </Form>
      </div>
    )
  }
}

export default OrderForm
