import ReactToPrint from "react-to-print";
import PropTypes from "prop-types";
import axios from 'axios';
import React, { Component } from 'react'
import { Form, FormGroup, Label, Input, Button } from 'reactstrap'
import Select from 'react-select';
import { withStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';
import Moment from 'moment';

const styles = theme => ({
	  root: {
	    width: '100%',
	    marginTop: theme.spacing.unit * 3,
	    overflowX: 'auto',
	  },
	  table: {
	    minWidth: 700,
	  },
	});

let id = 0;
function createData(name, calories, fat, carbs, protein) {
  id += 1;
  return { id, name, calories, fat, carbs, protein };
}

const rows = [
  createData('Frozen yoghurt', 159, 6.0, 24, 4.0),
];


class Example extends React.Component {
	
	 constructor () {
		    super()
		    this.state = {
		      numberorder: '', 
		      date: '', 
		      idcustomer: '', 
		      paymenttype: '',
		      customer: '',
		      
		      products : [],
		      selectedproducts:[]
		      
		    }
		  }
	
	 componentDidMount () {
		 this.loadExample()
		 }
	 
	 loadExample() {
		 let order;
		    const { match } = this.props
		  console.log(this.props.params)
		    const id = match.params.id  // take parameter url
		    if (id) {
		      // load the order data
		    	axios.get('/orders/' + id)
		        .then((result) => {
		    	  order = result.data 
		      	  this.setState({
		      		numberorder: order.numberorder || '',
		      		date: order.date || '',
		      		idcustomer: order.idcustomer || '',
		      		customer: order.name || '',
		             paymenttype: order.paymenttype || ''
		      	  })
		      	  
		      	  
		        });
		    	
		    	 axios.get('/ordersproducts/' + id)
		    	 .then((result) => {
		       	  let products1 = result.data // I cant solved  the issue  of many product selected  
		       	  console.log(result.data)
		         	  this.setState({
		         		 selectedproducts: products1 || '' // aqui
		         	  })
		           }); 
		    }
		  };
		  
			 
	
	
  render() {
	  let {customer, numberorder, date, idcustomer, paymenttype, selectedproducts } = this.state
	    const { match } = this.props  
    return (
    		
      <div>
        <ReactToPrint trigger={() => <a href="#">Print this out!</a>} content={() => this.componentRef} />
        <div ref={el => (this.componentRef = el)} >
        <table >
	        <thead>
	        	<th> Order number: {numberorder}</th>
	        	<th> Date: {Moment(date).format('MMM Do YYYY')}</th>
	        </thead>
	        <thead>
	        	<th>Customer: {customer}</th>
	        </thead>
        <tbody>
        <TableHead>
	        <TableRow>
		          <TableCell>Name</TableCell>
		          <TableCell>Description</TableCell>
		       
		          <TableCell numeric>Price</TableCell>
		          <TableCell numeric>Count</TableCell>
		          <TableCell numeric>Total</TableCell>
	        </TableRow>
      </TableHead>
        <TableBody>
        {selectedproducts.map(row => {
          return (
            <TableRow key={row.id}>
			       <TableCell component="th" scope="row">{row.name}</TableCell>
			       <TableCell >{row.description}</TableCell>
			       
			       <TableCell >{row.price}</TableCell>
			       <TableCell >{row.count}</TableCell>
			       <TableCell >{row.price * row.count}</TableCell>
		    </TableRow>
		          );
		        })}
        	</TableBody>
          
        </tbody>
        </table>
        </div>
        
        
        </div>
        
    );
  }
}

export default Example;


