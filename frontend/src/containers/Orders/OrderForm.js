
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
	 this.setState({ numberorder : !this.state.numberorder ? '2018-' +  Math.floor(Math.random() * Math.floor(1000)) : this.state.numberorder} 
	              /*,{ date : !this.state.date ? '' : this.state.date} */) 
	 }
  
  loadProducts() {
		    return axios.get('/products') ///axios llamasat http
		    .then((result) => {
	        this.setState({products: result.data})
	      })
  }
  
  
  loadCustomers() {
		// load customers
		    return axios.get('/customers') ///axios llamasat http
		      .then((result) => {
			        this.setState({customers: result.data})		    	
		      })
  }
  
  
  loadOrder() {
    const { match } = this.props
    const id = match.params.id  // take parameter url
    if (id) {
      // load the order data
    	axios.get('/orders/' + id)
        .then((result) => {
    	  let order = result.data 
      	  this.setState({
      		numberorder: order.numberorder || '',
      		date: order.date || '',
             idcustomer: order.idcustomer || '',
             paymenttype: order.paymenttype || ''
      	  })
      	  
      	  
        });
    	/*
    	 axios.get('/ordersproducts/' + id)
    	 .then((result) => {
       	  let products1 = result.data // I cant solved  the issue  of many product selected  
       	  alert(result.data)
         	  this.setState({
         		 selectedproducts: products1 || '' // aqui
         	  })
           });
    	 */
    	
    }
  }

  onSubmit () {
	  

    const { numberorder, date, idcustomer , paymenttype,  selectedproducts } = this.state
  /*  alert(numberorder)
    alert(date)
    alert(idcustomer.value)
    
    alert(selectedproducts)
    
    alert(paymenttype)
    */
    const { match } = this.props
    const id = match.params.id

    const order = {
      id,
      numberorder,
      date,
      idcustomer: idcustomer.value,
      paymenttype,
      products: selectedproducts
    }

    if (!id) {
      // create new
      axios.post('/orders', order)
        .then(function (response) {
        	
        })
    } else {
      // update
      axios.put('/orders', order)
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
            <Input type='text' name='numberorder' id='numberorder' value={numberorder}   onChange={(e) => this.setState({ numberorder: e.target.value })}/>
          </FormGroup>
          
            <FormGroup>
            <Label for='date'>date</Label>
            <Input type="date" name='date'        id='date'        value={date}           onChange={(e) => this.setState({ date: e.target.value })} / >
          </FormGroup>
          
          <FormGroup>
  	        <Label for='idcustomer'>Customer</Label>
  	        <Select onChange={(value) => this.setState({ idcustomer: value })}  options={this.state.customers.map(c => ({ label: c.name, value: c.id, name: c.name}))} />
          </FormGroup>
	       
          <FormGroup>
          <Label for='idproduct'>Product</Label>
          <Select isMulti  onChange={(value) => this.setState({ selectedproducts: value })}  options={this.state.products} />
          </FormGroup>  
          
          <FormGroup>
	          <Label for='paymenttype'>Payment Type</Label>
	          <Input type="select" name='paymenttype' id='paymenttype' value={paymenttype} onChange={(e) => this.setState({ paymenttype: e.target.value })}>
	          <option></option>
	          <option>Cash</option>
	          <option>Credit Card</option>
		          <option >Check</option>
		          <option>Other</option>
	          </Input>   
            </FormGroup>
            
            
           
            
          
          
          <Button color='primary' onClick={this.onSubmit}>Submit</Button>
          <Button onClick={() => this.props.history.push('/orders')}>Cancel</Button>
        </Form>
      </div>
    )
  }
}

export default OrderForm
