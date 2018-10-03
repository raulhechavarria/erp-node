/**
 * http://usejsdoc.org/
 */

const conn = require('../connect.js');

function find(res1){	
	//conn.client.connect()
	conn.client.query('select * from customer', (err, res) => {
	  if (err) console.log('error finding')
	  res1.status(200).json(res.rows)
	});	  
};

function findbyid(id,res1){
	conn.client.query("SELECT * FROM customer WHERE id = $1", [id], (err, res) => {
		  if (err) console.log('error findy by id')
		  res1.status(200).json(res.rows[0])
		// conn.client.end()
		  
	});	  
};

function save(customer,res1){
	if (customer.id) {
		const values = [customer.id, customer.name, customer.phone, customer.email, customer.streetandnumber, customer.city, customer.state, customer.zipcode, customer.country]
		conn.client.query({
		    name: 'insert customer',
		    text: "UPDATE customer SET name = $2, phone = $3, email = $4, streetandnumber = $5, city = $6, state = $7, zipcode = $8, country = $9 WHERE id = $1",
		    values: values 
		});
	} else {
		const values = [customer.name, customer.phone, customer.email, customer.streetandnumber, customer.city, customer.state, customer.zipcode, customer.country]		
		const text = 'INSERT INTO customer(name,phone,email,streetandnumber, city, state, zipcode, country) values($1,$2,$3,$4,$5,$6,$7,$8)'
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
		conn.client.query('DELETE FROM customer WHERE id = $1', [id], (err, res) => {
			  if (err) console.log('error deleted')
		    //  client.end()
		});
	} 
};



exports.save = save;
exports.del = del;
exports.find = find;
exports.findbyid = findbyid;