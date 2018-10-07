
import React, { Component } from 'react'
import { Form, FormGroup, Label, Input, Button } from 'reactstrap'
import axios from 'axios'
import Select from 'react-select'

class ProductForm extends Component {
  constructor () {
    super()
    this.state = {
    	id:'',
      name: '', 
      quantity: '',
      products: [{}]
    }

    this.onSubmit = this.onSubmit.bind(this)
  }

  componentDidMount () {
	 this.loadProducts()
  }
  
  loadProducts() {
	    return axios.get('/products') ///axios llamasat http
	    .then((result) => {
      this.setState({products: result.data})
    })
}

 onSubmit () {
    const { name, quantity, id} = this.state

    const producttemp = {
    		name, quantity, id
    }

    if (!id) {
      // create new
      axios.post('/prodducts', producttemp)
        .then(function (response) {
        	
        })
    } else {
      // update
      axios.put('/prodducts', producttemp)
        .then(function (response) {

        })
    }
    window.location.reload();
    this.props.history.push('/orders')
    
  }

  render () {
    const { name, quantity, id } = this.state

    return (
      <div>
        <Form>
        
	        <FormGroup>
	        	<Label for='idproduct'>Product</Label>
	        </FormGroup>
        
	        <FormGroup>
	            <Label for='quantity'>quantity</Label>
	            <Input type='text' name='quantity' id='quantity' value={quantity} onChange={(e) => this.setState({ quantity: e.target.value })} />
            </FormGroup>
	            
	            <FormGroup>
	            <Label for='idproduct'>Product</Label>
	            <Select  onChange={(value) => this.setState({ selectedproducts: value })}  options={this.state.products} />
	            </FormGroup>       
         
          <Button color='primary' onClick={this.onSubmit}>Submit</Button>
          <Button onClick={() => this.props.history.push('/dsfgsdfgdf')}>Cancel</Button>
          
          
          
        </Form>
      </div>
    )
  }
}

export default ProductForm
