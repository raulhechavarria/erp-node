/**
 * http://usejsdoc.org/
 */

const express1 = require("express");
const router = express1.Router();
const customer1 = require('../models/customer');


router.get('/:customerId', (req, res, next) =>{
	customer1.findbyid(req.params.customerId,res)
});

router.get('/', function (req, res) {
	customer1.find(res);
});

router.post('/', (req, res, next) =>{
	const customer = ({
		name: req.body.name,
		phone: req.body.phone,
		email: req.body.email,
		streetandnumber: req.body.streetandnumber, 
		city: req.body.city, 
		state: req.body.state, 
		zipcode: req.body.zipcode, 
		country: req.body.country,
		shippingAddresses: req.body.shippingAddresses
	});
	customer1.save(customer,res);
});

router.put('/', (req, res, next) =>{
	const customer = ({
		id : req.body.id,
		name: req.body.name,
		phone: req.body.phone,
		email: req.body.email,
		streetandnumber: req.body.streetandnumber, 
		city: req.body.city, 
		state: req.body.state, 
		zipcode: req.body.zipcode, 
		country: req.body.country,
		shippingAddresses: req.body.shippingAddresses
	});
//	console.log(customer);
	customer1.save(customer,res);
});


router.delete('/:customerId', (req, res, next) =>{
	customer1.del(res, req.params.customerId)
/*	res.status(200).json({
		message: 'customer deleted',
			customerId : req.params.customerId
	});*/
});

module.exports = router;