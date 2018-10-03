/**
 * http://usejsdoc.org/
 */

const express1 = require("express");
const router = express1.Router();
const ordersproduct1 = require('../models/ordersproduct');

router.get('/:idorders', (req, res, next) =>{
	ordersproduct1.findproductbyidorder(req.params.idorders,res)
});

router.get('/', function (req, res) {
	ordersproduct1.find(res);
});

router.get('/productDashRouter', function (req, res) {
	ordersproduct1.findTopProduct(res);
});

router.post('/', (req, res, next) =>{
	const ordersproduct = ({
		id : req.body.id,
		name: req.body.name,
		phone: req.body.phone,
		email: req.body.email,
		idshippingaddress: req.body.idshippingaddress
	});
	ordersproduct1.save(ordersproduct,res);
});

router.delete('/:ordersproductId', (req, res, next) =>{
	ordersproduct1.del(req.params.ordersproductId)
	res.status(200).json({
		message: 'ordersproduct deleted',
			ordersproductId : req.params.ordersproductId
	});
});

module.exports = router;