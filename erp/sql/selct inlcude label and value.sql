SELECT *, p.id as value, p.name as label  FROM ordersproduct op inner join product p on op.idproduct = p.id  WHERE idorders = 71 