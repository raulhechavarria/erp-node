/**
 * http://usejsdoc.org/
 */

const conn = require('../common/connect.js');
const exc = require('../common/HandlerException.js')
const ordersproduct = require('../models/ordersproduct');


function find(res1){	
	conn.client.query('select o.id, o.numberorder, o.date, o.idcustomer,o.paymenttype, sum(p.price*op.count) as total from orders as o inner join ordersproduct as op on o.id = op.idorders inner join product as p on op.idproduct = p.id group by o.id, o.numberorder, o.date, o.idcustomer,o.paymenttype', (err, res) => {
	  if (err) console.log("Error to select")
	  res1.status(200).json(res.rows)
	});
  //   
};


function findTopCustomer(res1){	
	conn.client.query('SELECT c.id, c.name, sum(p.price * op.count)as total,sum(op.count)as amount FROM customer as c INNER JOIN orders as o ON c.id = o.idcustomer inner join ordersproduct as op on o.id = op.idorders inner join product as p on op.idproduct = p.id group by c.id, c.name order by total asc', (err, res) => {
	if (err) console.log("Error to select top customer")
	  
	  res1.status(200).json(res.rows)
	// conn.client.end()
	});	  
};

function findbyid(id,res1){
	conn.client.query("SELECT o.id, o.numberorder, o.date, o.idcustomer, o.paymenttype, c.name, c.phone, c.email FROM orders o inner join customer c on o.idcustomer = c.id WHERE o.id = $1", [id], (err, res) => {
		if (err) {
			res1.status(200).json({
						message: err.stack,
					});
			console.log(err.stack);
		  } else {
			res1.status(200).json(res.rows[0]);
		//	console.log(res.rows[0]);
		  }
	});	  

};


function save(order, res1){
	if (order.products.length < 1) {
		res1.status(200).json({
			message: 'Most be select at least one product'
		});
	} else {
		 var  sql = 'INSERT INTO orders(numberorder,date, idcustomer, paymenttype) values($1,$2,$3,$4) RETURNING id';
		  var  values = [ order.numberorder, order.date, order.idcustomer,  order.paymenttype];
		  conn.client.query(sql, values, (err, res) => {
			  exc.predicError(err, res,res1)
			  if (!err) {
					var  idorders1 = res.rows[0].id;
					  order.products.forEach( function(value, index, array) {
						  const ordersproduct1 = ({
							  idproduct : value.id,
							  count : value.count,
							  idorders: idorders1,
							//  console.log()
							});
						  ordersproduct.save(ordersproduct1);  
						});
				  } 
		});
	}
};

function del(id,res1){
	ordersproduct.delOrder(id);	
		conn.client.query("DELETE FROM orders WHERE id = $1 returning id", [id], (err,res) =>{
			exc.predicError(err, res,res1)
		});
};

exports.findTopCustomer = findTopCustomer;
exports.save = save;
exports.del = del;
exports.find = find;
exports.findbyid = findbyid;