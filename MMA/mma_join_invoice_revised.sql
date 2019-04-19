SELECT i.OrderNumber, i.CustomerName, i.OrderDate,
		p.Code, p.Description, p.Price, li.Quantity
   from Product p
     inner join
        LineItem li
          on p.ID = li.ProductID
	 inner join
        Invoice i
          on i.ID = li.InvoiceID;