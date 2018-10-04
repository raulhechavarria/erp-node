import React, { Component } from 'react'
import {BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend} from 'recharts'
import axios from 'axios'
import TopCustomerDashBoard from './TopCustomerDashBoard'


class Home extends Component {
	  render () {
		    const {data} = this.state
		    return ({
		    		
		    		<TopCustomerDashBoard/>}
		    	
		    )
		  }
}

export default Home
