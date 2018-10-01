/**
 * http://usejsdoc.org/
 */

const conn = require('../connect.js');

function find(res1){	
	conn.client.query('select * from customer', (err, res) => {
	  if (err) throw err
	  res1.status(200).json(res.rows)
	});	  
};

function findbyid(id,res1){
	conn.client.query("SELECT * FROM customer WHERE id = $1", [id], (err, res) => {
		  if (err) throw err
		  res1.status(200).json(res.rows[0])
		// conn.client.end()
	});	  

};

function save(customer,res1){
	if (customer.id) {
		const values = [customer.id, customer.name, customer.phone, customer.email, customer.idshippingaddress]
		conn.client.query({
		    name: 'insert customer',
		    text: "UPDATE customer SET name = $2, phone = $3, email = $4, idshippingaddress = $5 WHERE id = $1",
		    values: values 
		});
	} else {
		const values = [customer.name, customer.phone, customer.email, customer.idshippingaddress]		
		const text = 'INSERT INTO customer(name,phone,email,idshippingaddress) values($1,$2,$3,$4)'
		conn.client.query(text, values, (err, res) => {
			if (err) {
			    console.log(err.stack)
			  } else {
				  res1.status(200).json(res)
			  }
		});	  
	}
};

function del(id){
	if (id) {
		conn.client.query({
		    name: 'insert customer',
		    text: "DELETE FROM customer WHERE id = $1",
		    values: [id]
		});
	} 
};



exports.save = save;
exports.del = del;
exports.find = find;
exports.findbyid = findbyid;