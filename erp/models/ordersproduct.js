/**
 * http://usejsdoc.org/
 */

const conn = require('../common/connect.js');
const exc = require('../common/HandlerException.js')
const product = require('../models/product');

function find(res1){	
	conn.client.query('select * from ordersproduct', (err, res) => {
	  if (err) throw err
	// console.log(res)
	  res1.status(200).json(res.rows)
	// conn.client.end()
	});	  
};

function findproductbyidorder(idorders,res1){
	conn.client.query("SELECT *, p.id as value, p.name as label  FROM ordersproduct op inner join product p on op.idproduct = p.id  WHERE idorders = $1", [idorders], (err, res) => {
		  if (err) throw err
		  var list = [];
			for (var i = 0; i < res.rows.length; i++) {
				 var prod;
			//	product.myFunction(res.rows[i].idproduct, prod);
				//var test = product.myFunction(res.rows[i].idproduct,3)
			//	 console.log(prod);
				
				list.push(prod);
			}		  
		  res1.status(200).json(res.rows);
		});	  
};

function findTopProduct(res1){	
	conn.client.query('SELECT p.name, op.idproduct as idproduct, count(op.idproduct) as total, (count(op.idproduct) * p.price) as amount FROM product as p INNER JOIN ordersproduct as op ON p.id = op.idproduct group by idproduct, name, p.price order by total desc', (err, res) => {
	  if (err) throw err
	// console.log(res)
	  res1.status(200).json(res.rows)
	// conn.client.end()
	});	  
};

function save(ordersproduct){
		conn.client.query({
		    name: 'insert ordersproduct',
		    text: "INSERT INTO ordersproduct(idproduct,idorders,count) values($1,$2,$3)",
		    values: [ ordersproduct.idproduct, ordersproduct.idorders, ordersproduct.count]
		});
};


function delOrder(id){
	if (id) {
		conn.client.query({
		    name: 'delete ordersproduct',
		    text: "DELETE FROM ordersproduct WHERE idorders = $1",
		    values: [id]
		});
	} 
};

exports.findTopProduct = findTopProduct
exports.save = save;
exports.delOrder = delOrder;
exports.find = find;
exports.findproductbyidorder = findproductbyidorder;