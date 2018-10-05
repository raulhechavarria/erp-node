import React, { Component } from 'react'
import {BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend} from 'recharts'
import axios from 'axios'
import TopCustomerDashBoard from './TopCustomerDashBoard'
import TopProductDashBoard from './TopProductDashBoard'


class Home extends Component {
	  render () {
		   
		    return (
		    	<div className='home'>
		            <div className='row'>
		              <div className='col-md-12'><TopCustomerDashBoard/></div>
		            </div>
		            <div className='row'>
		              <div className='col-md-12'><TopProductDashBoard/></div>
		            </div>
		        </div>
			    	
		    )
		  }}


export default Home
