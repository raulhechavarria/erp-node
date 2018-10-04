/**
 * http://usejsdoc.org/
 */

import React, { Component } from 'react'
import {BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend} from 'recharts'
import axios from 'axios'

class TopCustomerDashBoard {
	constructor(){
		super();
		this.state = {
			data: []
		}
	}
	componentDidMount() {
		let data = [
		    {name: 'aaaaa', uv: 4000, pv: 2400, amt: 2400},
		    {name: 'asdasdasda B', uv: 3000, pv: 1398, amt: 2210},
		    {name: 'Page C', uv: 2000, pv: 9800, amt: 2290},
		
		];
		 
		axios.get('http://localhost:3001/customerdashboard') ///axios llamasat http
	      .then((result) => {
	        this.setState({data: result.data})
	      })	      
	}	
  render () {
    const {data} = this.state
    return (
    		
    		<div id="container">
    		<label>Top Customers</label>
    		<BarChart width={600} height={300} data={data}
            margin={{top: 5, right: 30, left: 20, bottom: 5}}>
		       <CartesianGrid strokeDasharray="3 3"/>
		       <XAxis dataKey="name"/>
		       <YAxis/>
		       <Tooltip/>
		       <Legend />
		      
		       <Bar dataKey="total" fill="#82ca9d" />
		      </BarChart>
    	</div>
    )
  }
}
export default TopCustomerDashBoard
