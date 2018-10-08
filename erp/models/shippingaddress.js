/**
 * http://usejsdoc.org/ shippingaddress
 */

const conn = require('../common/connect.js');
const exc = require('../common/HandlerException.js')

function find(res1){	
	conn.client.query('select * from shippingaddress', (err, res) => {
	  if (err) console.log('error finding')
	  res1.status(200).json(res.rows)
	});	  
};

function findbyid(id,res1){
	conn.client.query("SELECT * FROM shippingaddress WHERE id = $1", [id], (err, res) => {
		if (err) {
			res1.status(200).json({
						message: err.stack,
					});
			console.log(err.stack);
		  } else {
			res1.status(200).json(res.rows[0]);	
		}});	  
};

function findbyidcustomer1(id,res1){
	conn.client.query("SELECT * FROM shippingaddress WHERE idcustomer = $1 ", [id], (err, res) => {
		if (err) {
			res1.status(200).json({
						message: err.stack,
					});
			console.log(err.stack);
		  } else {
			res1.status(200).json(res.rows);	
		}});	  
};

function save(shippingaddress){
		conn.client.query("INSERT INTO shippingaddress(streetandnumber,city,state,zipcode,country,idcustomer) values($1,$2,$3,$4,$5,$6) returning id",
		    [shippingaddress.streetandnumber, shippingaddress.city, shippingaddress.state, shippingaddress.zipcode,	shippingaddress.country, shippingaddress.idcustomer],
		    (err, res)=>{
		    	 if (err) console.log('error find top product')
		});
};

function del(id,res1){
	if (id) {
		conn.client.query("DELETE FROM shippingaddress WHERE id = $1 returning id", [id], (err, res)=>{
			exc.predicError(err, res,res1)
		});
	} 
};


exports.save = save;
exports.del = del;
exports.find = find;
exports.findbyid = findbyid;
exports.findbyidcustomer1 = findbyidcustomer1