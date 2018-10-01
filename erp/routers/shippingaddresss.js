/**
 * http://usejsdoc.org/
 */

const express1 = require("express");
const router = express1.Router();
const shippingaddress1 = require('../models/shippingaddress');

/// code  test
const conn = require('../connect.js');



router.get('/:shippingaddressId', (req, res, next) =>{
	shippingaddress1.findbyid(req.params.shippingaddressId,res)
});

router.get('/', function (req, res) {
	shippingaddress1.find(res);
});

router.post('/', (req, res, next) =>{
	const shippingaddress = ({
		streetandnumber: req.body.streetandnumber,
		city : req.body.city,
		state : req.body.state,
		zipcode : req.body.zipcode,
		country : req.body.country
	});
	
    shippingaddress1.save(shippingaddress)
	res.status(201).json({
		message: 'handle post',
		shippingaddress: shippingaddress
	});
});

router.delete('/:shippingaddressId', (req, res, next) =>{
	shippingaddress1.del(req.params.shippingaddressId)
	res.status(200).json({
		message: 'shippingaddress deleted',
			shippingaddressId : req.params.shippingaddressId
	});
});

module.exports = router;