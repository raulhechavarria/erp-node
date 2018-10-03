/**
 * http://usejsdoc.org/
 */

const express1 = require("express");
const router = express1.Router();
const product1 = require('../models/product');


/// code  test
const conn = require('../connect.js');

router.get('/', function (req, res) {
	product1.find(res);
});

router.get('/:productId', (req, res, next) =>{
	product1.findbyid(req.params.productId,res)
});

router.post('/', (req, res, next) =>{
	const product = ({
		name: req.body.name,
		description: req.body.description,
		weight: req.body.weight,
		price: req.body.price
	});
	product1.save(product);
	res.status(201).json({
		message: 'product was  saved',
		product: product
	});
});

router.put('/', (req, res, next) =>{
	const product = ({
		id : req.body.id,
		name: req.body.name,
		description: req.body. description,
		weight: req.body.weight,
		price: req.body.price
	});
	product1.save(product);
	res.status(201).json({
		message: 'product was update',
		product: product
	});
});

router.delete('/:productId', (req, res, next) =>{
	product1.del(req.params.productId)
	res.status(200).json({
		message: 'product deleted',
			id:"sdfsdf",
			productId : req.params.productId
	});
});

module.exports = router;