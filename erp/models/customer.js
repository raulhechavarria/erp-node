/**
 * http://usejsdoc.org/
 */

const conn = require('../common/connect.js');
const exc = require('../common/HandlerException.js')
const shippingaddress = require('../models/shippingaddress')

function find(res1){	
	// conn.client.connect()
	conn.client.query('select * from customer', (err, res) => {
	  if (err) console.log('error finding')
	  res1.status(200).json(res.rows)
	});	  
};

function findbyid(id,res1){
	conn.client.query("SELECT * FROM customer WHERE id = $1", [id], (err, res) => {
		  if (err) {
			res1.status(200).json({
						message: err.stack,
					});
			console.log(err.stack);
		  } else {
			res1.status(200).json(res.rows[0]);		  
	}});	  
};

function save(customer,res1){
	console.log(customer)
	if (customer.id) {
		const values = [customer.id, customer.name, customer.phone, customer.email, customer.streetandnumber, customer.city, customer.state, customer.zipcode, customer.country]
		const text = "UPDATE customer SET name = $2, phone = $3, email = $4, streetandnumber = $5, city = $6, state = $7, zipcode = $8, country = $9 WHERE id = $1 returning id";
		conn.client.query(text, values, (err, res) => {
			exc.predicError(err, res,res1)
			if (!err) {	  
		var  idcustomer = res.rows[0].id;
		customer.shippingAddresses.forEach( function(value, index, array) {
			  const shiAdd = ({
				  streetandnumber: value.streetandnumber1,
	    	      city : value.city1 ,
	    	      state: value.state1 ,
	    	      zipcode: value.zipcode1 ,
	    	      country: value.country1, 
				  idcustomer: idcustomer
				});
			  shippingaddress.save1(shiAdd);  
			});
	  }
		});
	} else {
		const values = [customer.name, customer.phone, customer.email, customer.streetandnumber, customer.city, customer.state, customer.zipcode, customer.country]		
		const text = 'INSERT INTO customer(name,phone,email,streetandnumber, city, state, zipcode, country) values($1,$2,$3,$4,$5,$6,$7,$8) returning id'
		conn.client.query(text, values, (err, res) => {
			exc.predicError(err, res,res1)
			if (!err) {	  
		var  idcustomer = res.rows[0].id;
		customer.shippingAddresses.forEach( function(value, index, array) {
			  const shiAdd = ({
				  streetandnumber: value.streetandnumber1,
	    	      city : value.city1 ,
	    	      state: value.state1 ,
	    	      zipcode: value.zipcode1 ,
	    	      country: value.country1, 
				  idcustomer: idcustomer
				});
			  shippingaddress.save1(shiAdd);  
			});
	  }
		});	  
	}
	 
	
};

function del(res1,id){
	if (id) {
		conn.client.query('DELETE FROM customer WHERE id = $1 returning id', [id], (err, res) => {
			exc.predicError(err, res,res1)
		});
	} 
};



exports.save = save;
exports.del = del;
exports.find = find;
exports.findbyid = findbyid;