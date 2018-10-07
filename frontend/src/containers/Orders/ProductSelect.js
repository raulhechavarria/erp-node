import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { Form, FormGroup, Label, Input, Button } from 'reactstrap'
import axios from 'axios'
import '../../css/ProductForm.css'
import Select from 'react-select'
class ProductSelect extends Component {
  constructor () {
    super()
    this.state = {
    	id: '',
    	name: '',
        quantity:'',
        products: [{
           
          }]
    }
  }


  render () {
    const { products } = this.state
    return (
    		<div>
    		</div>
    )
  }
}

export default ProductSelect
