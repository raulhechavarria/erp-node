/**
 * http://usejsdoc.org/
 */

const express1 = require("express");
const router = express1.Router();
const order1 = require('../models/order');

// / code test
const conn = require('../connect.js');

router.get('/:orderId', (req, res, next) =>{
	order1.findbyid(req.params.orderId,res)
});

router.get('/', function (req, res) {
	order1.find(res);
});

router.post('/', (req, res, next) =>{
	const order = ({
		number: req.body.number, 
		date: req.body.date, 
		idcustomer: req.body.idcustomer, 
		idshippingaddress: req.body.idshippingaddress, 
		paymenttype: req.body.paymenttype,
		products: req.body.products
	});
	order1.save(order, res);
	
});

router.delete('/:orderId', (req, res, next) =>{
	
    if (req.params.orderId) {
    	order1.del(req.params.orderId,res);
	} else {
		res.status(200).json({
			message: 'order doesnt deleted',
			orderId : req.params.orderId
		});
	}
		
	
	
});

module.exports = router;