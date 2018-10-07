/**
 * http://usejsdoc.org/
 */

const conn = require('../common/connect.js');
const exc = require('../common/HandlerException.js')

function find(res1){	
	//conn.client.connect()
	conn.client.query('select *, id as value, name as label from product', (err, res) => {
	  if (err) throw err
	  res1.status(200).json(res.rows)
	//  conn.client.release();
	});	  
};

function findbyid(id,res1){
	var obj;
	conn.client.query("SELECT * FROM product WHERE id = $1", [id], (err, res) => {
		if (err) {
			res1.status(200).json({
						message: err.stack,
					});
			console.log(err.stack);
		  } else {
			res1.status(200).json(res.rows[0]);
		}});
	//console.log(obj);
	return obj;
};


function save(product,res1){
	if (product.id) {
		conn.client.query("UPDATE product SET name = $2, description = $3, weight = $4, price = $5 WHERE id = $1 returning id",
				 		[product.id, product.name, product.description, product.weight, product.price]	,(err,res)=> {
				 			exc.predicError(err, res,res1)
		});
	} else {
		conn.client.query("INSERT INTO product(name,description, weight, price) values($1,$2,$3,$4) returning id",
						  [product.name, product.description, product.weight, product.price],(err,res)=> {
							exc.predicError(err, res,res1)
		});
	}
};

function del(id,res1){
	if (id) {
		conn.client.query("DELETE FROM product WHERE id = $1 returning id",[id], (err,res) =>{
			 exc.predicError(err, res,res1) 
		});
	} 
};


function myFunction(id,res1) {
	conn.client.query("SELECT * FROM product WHERE id = $1", [id], (err, res) => {
		  if (err) console.log('error deleted')
			  res1 =  res.rows[0];
			//  console.log(res1);
		});
}

exports.myFunction = myFunction;
exports.save = save;
exports.del = del;
exports.find = find;
exports.findbyid = findbyid;