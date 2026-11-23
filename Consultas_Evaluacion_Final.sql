USE Evaluacion_Final;

SELECT 

c.Customer_Name AS Nombre_Cliente,
v.Order_Date AS Fecha_Compra,
v.Total_sales AS Total_Venta

FROM Fact_Ventas AS v
INNER JOIN Dim_Clientes AS c
	ON v.ID_Cliente = c.ID_Cliente
WHERE v.Order_Date BETWEEN 
	DATEADD(DAY,-30,(SELECT MAX(Order_Date) FROM Fact_Ventas))
	AND (SELECT MAX(Order_Date) FROM Fact_Ventas)
ORDER BY v.Order_Date DESC;