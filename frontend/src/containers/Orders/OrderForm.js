
import React, { Component } from 'react'
import { Form, FormGroup, Label, Input, Button, Row, Col } from 'reactstrap'
import axios from 'axios'
import Select from 'react-select'
import ProductSelect from './ProductSelect'
//import {BootstrapTable, TableHeaderColumn} from 'react-bootstrap-table';
import DataTable from 'react-data-table-component'

//import {BootstrapTable, TableHeaderColumn} from 'react-bootstrap-table';
//with es5
var ReactBsTable = require('react-bootstrap-table');
var BootstrapTable = ReactBsTable.BootstrapTable;
var TableHeaderColumn = ReactBsTable.TableHeaderColumn;


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
      products1 : [],
      selectedproducts:[],
      idproduct:'',
      count:'',
      id:'',
      shippingaddresses:[],
      idshippingaddress:''
    }
    this.onSubmit = this.onSubmit.bind(this)
    this.onSubmitProduct =this.onSubmitProduct.bind(this)
  }
  

  componentDidMount () {
	 this.loadOrder()
	 this.loadCustomers()
	 this.loadProducts()
	 this.loadshippinpaddressCustomer()
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
    }
  }
  
  loadshippinpaddressCustomer(id) {
	//  alert(id)
	 // console.log(id)
	  if (id) {
		  return axios.get('/shippingaddresses/'+2+'/'+id) ///axios llamasat http
	      .then((result) => {
	    //	alert(id + result.data)
	    	  		this.setState({shippingaddresses: result.data})	
			//	}
	      })
	} else {
		 return axios.get('/shippingaddresses') ///axios llamasat http
	      .then((result) => {
		        this.setState({shippingaddresses: result.data})		    	
	      })
	}
	    
  }

  onSubmit () {
    const {idshippingaddress, shippingaddresses, products1, numberorder, date, idcustomer , paymenttype,  selectedproducts } = this.state
    const { match } = this.props
    const id = match.params.id
    const order = {
      id,
      numberorder,
      date,
      idcustomer: idcustomer.value,
      paymenttype,
      products: products1,
      idshippingaddress
     // products: selectedproducts
    }

    if (!id) {
      // create new
      axios.post('/orders', order)     
        .then(function (response) {
        	alert(response.data.message)
        })
    } else {
      // update
      axios.put('/orders', order)
        .then(function (response) {
        	alert(response.data.message)
        })
    }
    window.location.reload();
    this.props.history.push('/orders')
  }
  
  onSubmitProduct () {
	    const {id, name, count, idproduct , selectedproducts } = this.state
	    const prod = {
	    	      id:idproduct.id,
	    	      idproduct,
	    	      name:idproduct.name,
	    	      count,
	    	    }
	    let flag = false
	    this.state.products1.forEach(
	    		 function(value, index, array) {
					    flag = (value.id == prod.id)						
					});
	    if (flag) {
	    	alert('product was added before')
		} else {
			this.setState({products1: this.state.products1.concat(prod)})
		}
	 }

  render () {

	  let {idshippingaddress, shippingaddresses, id, idproduct, name, count, numberorder, date, idcustomer, paymenttype, products1 } = this.state
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
            <Input type="date" name='date'      id='date' value={date} onChange={(e) => this.setState({ date: e.target.value })} / >
          </FormGroup>
          
            <FormGroup>
  	        <Label for='idcustomer'>Customer</Label>
  	        <Select onChange={(value) => {this.setState({ idcustomer: value }); this.loadshippinpaddressCustomer(this.state.idcustomer.value)}}  options={this.state.customers.map(c => ({ label: c.name, value: c.id, name: c.name}))} />
          </FormGroup>
	       
  	      <FormGroup>
	        <Label for='idshippingaddress'>Shipping Address</Label>
	        <Select onChange={(value) => this.setState({ idshippingaddress: value })}  options={this.state.shippingaddresses.map(c => ({ label: c.streetandnumber, value: c.id, name: c.streetandnumber}))} />
        </FormGroup>
	       
	        
  	       
	          <FormGroup>
		          <Label for='idproduct'>Products</Label>
		          <Row>
			          <Col><Select onChange={(value) => this.setState({ idproduct: value })}  options={this.state.products} /></Col>
			          <Col><Input type='number' name='count' id='count' value={count}   onChange={(e) => this.setState({ count: e.target.value })}/></Col>
			          <Col><Button color='primary' onClick={this.onSubmitProduct}> Submit product to order</Button></Col>
		          </Row>
		          <BootstrapTable data={products1} striped hover>
			          <TableHeaderColumn isKey dataField='id'>Product ID</TableHeaderColumn>
			          <TableHeaderColumn dataField='name'>Product Name</TableHeaderColumn>
			          <TableHeaderColumn dataField='count'>count</TableHeaderColumn>
			      </BootstrapTable>
	              
	             
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
