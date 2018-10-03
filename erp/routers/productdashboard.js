/**
 * http://usejsdoc.org/
 */

const express1 = require("express");
const router = express1.Router();
const ordersproduct1 = require('../models/ordersproduct');


router.get('/', function (req, res) {
	ordersproduct1.findTopProduct(res);
});

module.exports = router;