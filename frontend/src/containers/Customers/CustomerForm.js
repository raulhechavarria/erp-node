
import React, { Component } from 'react'
import { Form, FormGroup, Label, Input, Button } from 'reactstrap'
import axios from 'axios'

class CustomerForm extends Component {
  constructor () {
    super()
    this.state = {
      name: '',
      phone: '',
      email: '',
      address: '',

      customers: [{
        id: 1,
        name: 'John Milot',
        phone: 3213213,
        email: 'asd@asd.asd',
        address: 'lalala'
      }]
    }

    this.onSubmit = this.onSubmit.bind(this)
  }

  componentWillMount () {
    const { match } = this.props
    const id = match.params.id
    if (id) {
      // load the customer data
      const customer = this.state.customers[0]
      this.setState({
        name: customer.name,
        phone: customer.phone,
        email: customer.email,
        address: customer.address
      })
    }
  }

  onSubmit () {
    const { name, phone, email, address } = this.state
    const { match } = this.props
    const id = match.params.id

    const customer = {
      id,
      name,
      phone,
      email,
      address
    }

    if (!id) {
      // create new
      axios.post('http://localhost:3000/customers', customer)
        .then(function (response) {

        })
    } else {
      // update
      axios.get('http://example.com/movies.json')
        .then(function (response) {

        })
    }
    this.props.history.push('/customers')
  }

  render () {
    const { name, phone, email, address } = this.state
    const { match } = this.props

    return (
      <div>
        <h3>Customer Data Id:{match.params.id}</h3>
        <Form>
          <FormGroup>
            <Label for='name'>Name</Label>
            <Input type='text' name='name' value={name} id='name' onChange={(e) => this.setState({ name: e.target.value })} />
          </FormGroup>
          <FormGroup>
            <Label for='phone'>Phone</Label>
            <Input type='text' name='phone' id='phone' value={phone} onChange={(e) => this.setState({ phone: e.target.value })} />
          </FormGroup>
          <FormGroup>
            <Label for='exampleEmail'>Email</Label>
            <Input type='email' name='email' id='exampleEmail' value={email} onChange={(e) => this.setState({ email: e.target.value })} />
          </FormGroup>
          <FormGroup>
            <Label for='shipping'>Main Shipping Address</Label>
            <Input type='text' name='shipping' id='shipping' value={address} onChange={(e) => this.setState({ address: e.target.value })} />
          </FormGroup>
          <Button color='primary' onClick={this.onSubmit}>Submit</Button>
          <Button onClick={() => this.props.history.push('/customers')}>Cancel</Button>
        </Form>
      </div>
    )
  }
}

export default CustomerForm
