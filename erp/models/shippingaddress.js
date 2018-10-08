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


function save(shippingaddress,res1){
	if (shippingaddress.id) {
		conn.client.query("UPDATE shippingaddress SET streetandnumber = $2, city = $3, state = $4, zipcode = $5, country = $6, idcustomer = $7 WHERE id = $1 returning id",
		    [shippingaddress.id, shippingaddress.streetandnumber, shippingaddress.city, shippingaddress.state, shippingaddress.zipcode,	shippingaddress.country, shippingaddress.idcustomer],
		    (err, res)=>{
		    	exc.predicError(err, res,res1)
		});
		}else{
			conn.client.query("INSERT INTO shippingaddress(streetandnumber,city,state,zipcode,country,idcustomer) values($1,$2,$3,$4,$5,$6) returning id",
				    [shippingaddress.streetandnumber, shippingaddress.city, shippingaddress.state, shippingaddress.zipcode,	shippingaddress.country, shippingaddress.idcustomer],
				    (err, res)=>{
				    	exc.predicError(err, res,res1)
		})
		}
};


function save1(shippingaddress){
			conn.client.query("INSERT INTO shippingaddress(streetandnumber,city,state,zipcode,country,idcustomer) values($1,$2,$3,$4,$5,$6) returning id",
				    [shippingaddress.streetandnumber, shippingaddress.city, shippingaddress.state, shippingaddress.zipcode,	shippingaddress.country, shippingaddress.idcustomer],
				    (err, res)=>{
				    	if (err) {
							
							console.log(err.stack);
						  } else {
							
							console.log(res.rows[0].id);
						  } 
		})
};

function del(id,res1){
	if (id) {
		conn.client.query("DELETE FROM shippingaddress WHERE id = $1 returning id", [id], (err, res)=>{
			exc.predicError(err, res,res1)
		});
	} 
};


exports.save = save;
exports.save1 = save1;
exports.del = del;
exports.find = find;
exports.findbyid = findbyid;
exports.findbyidcustomer1 = findbyidcustomer1