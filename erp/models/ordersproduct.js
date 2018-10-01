/**
 * http://usejsdoc.org/
 */

const conn = require('../connect.js');
const product = require('../models/product');

function save(ordersproduct){
		conn.client.query({
		    name: 'insert ordersproduct',
		    text: "INSERT INTO ordersproduct(idproduct,idorders) values($1,$2)",
		    values: [ ordersproduct.idproduct, ordersproduct.idorders]
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

function find(res1){	
	conn.client.query('select * from ordersproduct', (err, res) => {
	  if (err) throw err
	// console.log(res)
	  res1.status(200).json(res)
	// conn.client.end()
	});	  
};


function findproductbyidorder(idorders,res1){
	conn.client.query("SELECT * FROM ordersproduct WHERE idorders = $1", [idorders], (err, res) => {
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

exports.save = save;
exports.delOrder = delOrder;
exports.find = find;
exports.findproductbyidorder = findproductbyidorder;