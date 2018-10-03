
import React, { Component } from 'react'
import { Form, FormGroup, Label, Input, Button } from 'reactstrap'
import axios from 'axios'

class ProductForm extends Component {
  constructor () {
    super()
    this.state = {
      name: '', 
      description: '',
      weight: '',
      price: ''
    }

    this.onSubmit = this.onSubmit.bind(this)
  }

  componentDidMount () {
	 this.loadProduct()
  }
  
  loadProduct() {
    const { match } = this.props
    const id = match.params.id
    if (id) {
      // load the product data
    	axios.get('http://localhost:3001/products/' + id)
        .then((result) => {
    	  let product = result.data
      	  this.setState({
      		 name: product.name || '',
             description: product.description || '',
             weight: product.weight || '',
             price: product.price || ''
      	  })
        }) 
    }
  }

  onSubmit () {
    const { name, description, weight, price } = this.state
    const { match } = this.props
    const id = match.params.id

    const product = {
      id,
      name,
      description,
      weight,
      price
    }

    if (!id) {
      // create new
      axios.post('http://localhost:3001/products', product)
        .then(function (response) {
        	
        })
    } else {
      // update
      axios.put('http://localhost:3001/products', product)
        .then(function (response) {

        })
    }
    this.props.history.push('/products')
  }

  render () {
    const { name, description, weight, price } = this.state
    const { match } = this.props

    return (
      <div>
        <h3>Product Data Id:{match.params.id}</h3>
        <Form>
          <FormGroup>
            <Label for='name'>Name</Label>
            <Input type='text' name='name' value={name} id='name' onChange={(e) => this.setState({ name: e.target.value })} />
          </FormGroup>
          <FormGroup>
            <Label for='description'>description</Label>
            <Input type='text' name='description' id='description' value={description} onChange={(e) => this.setState({ description: e.target.value })} />
          </FormGroup>
          <FormGroup>
            <Label for='weight'>weight</Label>
            <Input type='weight' name='weight' id='weight' value={weight} onChange={(e) => this.setState({ weight: e.target.value })} />
          </FormGroup>
          <FormGroup>
            <Label for='price'>Price</Label>
            <Input type='text' name='price' id='price' value={price} onChange={(e) => this.setState({ price: e.target.value })} />
          </FormGroup>
          <Button color='primary' onClick={this.onSubmit}>Submit</Button>
          <Button onClick={() => this.props.history.push('/products')}>Cancel</Button>
        </Form>
      </div>
    )
  }
}

export default ProductForm
