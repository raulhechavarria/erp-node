/**
 * http://usejsdoc.org/
 */

const express = require('express'),
      app = express(),
      bodyParser = require('body-parser'),
      pg = require('pg'),
      conet = require('./connect');

// support parsing of application/json type post data
app.use(bodyParser.json());

//support parsing of application/x-www-form-urlencoded post data
app.use(bodyParser.urlencoded({ extended: true }));

const productRouter = require('./routers/products');
const shippingaddressRouter = require('./routers/shippingaddresss');
const customerRouter = require('./routers/customers');
const ordersRouter = require('./routers/orders');
const ordersproductRouter = require('./routers/ordersproducts');

//pg.connect(conet);

// routers
app.use('/products', productRouter);
app.use('/shippingaddresss', shippingaddressRouter);
app.use('/customers', customerRouter);
app.use('/orders', ordersRouter);
app.use('/ordersproducts', ordersproductRouter);

module.exports = app;
