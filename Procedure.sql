CREATE PROCEDURE summary_order_status @StatusID int AS
BEGIN
	SELECT
		FactSalesOrder.OrderID,
		DimCustomer.CustomerName,
		DimProduct.ProductName,
		FactSalesOrder.Quantity,
		DimStatusOrder.StatusOrder
	FROM FactSalesOrder
	JOIN DimCustomer ON FactSalesOrder.CustomerID = DimCustomer.CustomerID
	JOIN DimProduct ON FactSalesOrder.ProductID = DimProduct.ProductID
	JOIN DimStatusOrder ON FactSalesOrder.StatusID = DimStatusOrder.StatusID
	WHERE FactSalesOrder.StatusID = @StatusID;
END;