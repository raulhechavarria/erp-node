/**
 * http://usejsdoc.org/
 */

const conn = require('../connect.js');

function find(res1){	
	conn.client.query('select * from product', (err, res) => {
	  if (err) throw err
	  res1.status(200).json(res.rows)
	});	  
};

function findbyid(id,res1){
	var obj;
	conn.client.query("SELECT * FROM product WHERE id = $1", [id], (err, res) => {
		  if (err) throw err
		  
		  if (res1 == null) {
			 // console.log(res.rows[0]);
			  obj =  res.rows[0];
			  console.log(obj);
		} else {
		//	console.log(res.rows[0]);
			res1.status(200).json(res.rows[0])
		}
		});
	//console.log(obj);
	return obj;
};

function save(product){
	if (product.id) {
		conn.client.query({
		    name: 'update product',
		    text: "UPDATE product SET name = $2, description = $3, weight = $4, price = $5 WHERE id = $1",
		    values: [product.id, product.name, product.description, product.weight, product.price]
		});
	} else {
		conn.client.query({
		    name: 'insert product',
		    text: "INSERT INTO product(name,description, weight, price) values($1,$2,$3,$4)",
		    values: [product.name, product.description, product.weight, product.price]
		});
	}
};

function del(id){
	if (id) {
		conn.client.query({
		    name: 'insert product',
		    text: "DELETE FROM product WHERE id = $1",
		    values: [id]
		});
	} 
};



function myFunction(id,res1) {
	conn.client.query("SELECT * FROM product WHERE id = $1", [id], (err, res) => {
		  if (err) throw err
			  res1 =  res.rows[0];
			//  console.log(res1);
		});
}

exports.myFunction = myFunction;
exports.save = save;
exports.del = del;
exports.find = find;
exports.findbyid = findbyid;