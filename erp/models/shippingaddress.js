/**
 * http://usejsdoc.org/
 */

const conn = require('../connect.js');

function find(res1){	
	conn.client.query('select * from shippingaddress', (err, res) => {
	  if (err) throw err
	// console.log(res)
	  res1.status(200).json(res.rows)
	// conn.client.end()
	});	  
};

function findbyid(id,res1){
	conn.client.query("SELECT * FROM shippingaddress WHERE id = $1", [id], (err, res) => {
		  if (err) throw err
		// console.log(res)
		  res1.status(200).json(res.rows[0])
		// conn.client.end()
		});	  
};

function save(shippingaddress){
		conn.client.query({
		    name: 'insert shippingaddress',
		    text: "INSERT INTO shippingaddress(streetandnumber,city,state,zipcode,country) values($1,$2,$3,$4,$5)",
		    values:  [
				shippingaddress.streetandnumber,
				shippingaddress.city,
				shippingaddress.state,
				shippingaddress.zipcode,
				shippingaddress.country]
		});
};

function del(id){
	if (id) {
		conn.client.query({
		    name: 'insert shippingaddress',
		    text: "DELETE FROM shippingaddress WHERE id = $1",
		    values: [id]
		});
	} 
};


exports.save = save;
exports.del = del;
exports.find = find;
exports.findbyid = findbyid;