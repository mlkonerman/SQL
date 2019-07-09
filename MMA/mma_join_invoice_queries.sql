SELECT i.OrderNumber, i.CustomerName, i.OrderDate,
		p.Code, p.Description, p.Price, li.Quantity
   from Product p
     inner join
        LineItem li
          on p.ID = li.ProductID
	 inner join
        Invoice i
          on i.ID = li.InvoiceID;

SELECT * from product
	order by price desc;
    
SELECT price, count(Price) FROM mma.product
	group by price;

SELECT *, li.quantity*p.price as Subtotal from lineitem li
	join product p
		on li.productID = p.ID;