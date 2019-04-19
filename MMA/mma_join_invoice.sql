SELECT InvoiceID, CustomerName, OrderNumber, OrderDate, ProductID, Code, Description, Price,
       Quantity, Total
			FROM lineitem l
            inner join
				 invoice i
					on l.InvoiceID = i.ID
			inner join
				 product p 
					on l.ProductID = p.ID