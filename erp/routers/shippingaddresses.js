/**
 * http://usejsdoc.org/
 */
const express1 = require("express");
const router = express1.Router();
const shippingaddress1 = require('../models/shippingaddress');

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
		country : req.body.country,
		idcustomer:req.body.idcustomer
	});
	console.log(shippingaddress)
    shippingaddress1.save(shippingaddress, res)
	
});

router.delete('/:shippingaddressId', (req, res, next) =>{
	shippingaddress1.del(req.params.shippingaddressId, res)
});

module.exports = router;