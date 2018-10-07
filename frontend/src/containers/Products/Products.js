import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { Form, FormGroup, Label, Input, Button } from 'reactstrap'
import axios from 'axios'
import '../../css/ProductForm.css'

class Products extends Component {
  constructor () {
    super()
    this.state = {
      name: '',
      description: '',
      weight: '',
      price: '',

      products: [{
        id: 1,
        name: 'fan',
        description: 3213213
      }]
    }

    this.onSubmit = this.onSubmit.bind(this)
  }

  onDelete (e, id) {
    e.preventDefault()
    if (window.confirm('Are you sure to delete: ' + id + '?')) {
      // delete
    	axios
    	.delete('/products/' + id)
    	.then((res) => {
    		alert(res.data.message)
    		this.loadProducts();
    		//window.confirm('done')
       	    this.props.history.push('/products')
        })
 }
  }

  onSubmit () {
    const { name, description, weight, price } = this.state

  }

  componentDidMount () {
    // load products
    this.loadProducts()
  }
  
  loadProducts() {
	// load products
	    return axios.get('/products') ///axios llamasat http
	      .then((result) => {
	        this.setState({products: result.data})
	      })
  }

  render () {
    const { products } = this.state
    return (
      <div className='products'>
        <div>
          <h3>List Products <Link to='/products/new' className='btn btn-primary'>New</Link></h3>
          <div className='row'>
            <div className='col-md-3'>Name</div>
            <div className='col-md-3'>description</div>
            <div className='col-md-3'>Actions</div>
          </div>
          {products.map((product, i) =>
            <div className='row' key={i}>
              <div className='col-md-3'>{product.name}</div>
              <div className='col-md-3'>{product.description}</div>
              <div className='col-md-3'>
                <a href={'/products/edit/' + product.id}>Edit</a>
                <a href='' onClick={(e) => this.onDelete(e, product.id)}>Delete</a>
              </div>
            </div>
          )}
        </div>
      </div>
    )
  }
}

export default Products
