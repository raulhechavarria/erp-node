/**
 * http://usejsdoc.org/
 */
function predicError(err,res,res1) {
	if (err) {
			res1.status(200).json({
						message: err.stack,
					});
			console.log(err.stack);
		  } else {
			res1.status(200).json({
							message: res.rows[0].id,
						});
			console.log(res.rows[0].id);
		  } 
};


exports.predicError = predicError;