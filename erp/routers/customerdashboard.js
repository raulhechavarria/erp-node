/**
 * http://usejsdoc.org/
 */

const express1 = require("express");
const router = express1.Router();
const order1 = require('../models/order');



router.get('/', function (req, res) {
	order1.findTopCustomer(res);
});

module.exports = router;