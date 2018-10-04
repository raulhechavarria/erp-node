/**
 * http://usejsdoc.org/
 */

const conn = require('../connect.js');
const ordersproduct = require('../models/ordersproduct');


function find(res1){	
	conn.client.query('select o.id, o.numberorder, o.date, o.idcustomer,o.paymenttype, sum(p.price) as total from orders as o inner join ordersproduct as op on o.id = op.idorders inner join product as p on op.idproduct = p.id group by o.id, o.numberorder, o.date, o.idcustomer,o.paymenttype', (err, res) => {
	  if (err) console.log("Error to select")
	  res1.status(200).json(res.rows)
	});
  //   
};


function findTopCustomer(res1){	
	conn.client.query('SELECT customer.name as name, count(orders.idcustomer) as total  FROM orders INNER JOIN customer ON customer.id = orders.idcustomer group by name order by total desc', (err, res) => {
	  if (err) throw err
	 console.log(res)
	  res1.status(200).json(res.rows)
	// conn.client.end()
	});	  
};

function findbyid(id,res1){
	conn.client.query("SELECT * FROM orders WHERE id = $1", [id], (err, res) => {
		  if (err) throw err
		// console.log(res)
		  res1.status(200).json(res.rows[0])
		// conn.client.end()
		});	  

};

function save(order, res1){

		  var  sql = 'INSERT INTO orders(numberorder,date, idcustomer, paymenttype) values($1,$2,$3,$4) RETURNING id';
		  var  values = [ order.numberorder, order.date, order.idcustomer,  order.paymenttype];
		  var idorders1;
		  conn.client.query(sql, values, (err, res) => {
			  if (err) {
				    console.log(err.stack)
				  } else {
					  res1.status(200).json(res.rows[0].id);
					  idorders1 = res.rows[0].id;
					  order.products.forEach( function(value, index, array) {
						  const ordersproduct1 = ({
							  idproduct : value.id,
							  idorders: idorders1,
							});
						  ordersproduct.save(ordersproduct1);  
						  // console.log("En el índice " + indice + " hay este
							// valor: " + valor);
						});
				  } 
		});
};

function del(id,res1){
	ordersproduct.delOrder(id);	
		conn.client.query("DELETE FROM orders WHERE id = $1", [id], (err,res) =>{
			 if (err) throw err
			 res1.status(200).json({
					 message: 'order deleted',
					 orderId : res.rows[0]
			 })
		});
};

exports.findTopCustomer = findTopCustomer;
exports.save = save;
exports.del = del;
exports.find = find;
exports.findbyid = findbyid;