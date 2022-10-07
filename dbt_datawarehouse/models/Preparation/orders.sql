{{ config( alias="Order_alias", schema="Preps", materialized="table",  )}}
SELECT 
	cast(soh.OrderDate as date) OrderDate,
	soh.SalesOrderNumber,
	soh.CustomerID,
	Product.Name ProductName,
	cast(sum(sod.LineTotal) as decimal(10,2)) Total,
	sum(sod.OrderQty) Aantal,
	sum(Product.ListPrice) ListPrice,
	sum(sod.UnitPriceDiscount) Discount
  FROM {{source("Sales","SalesOrderHeader")}} soh
  left join {{source("Sales","SalesOrderDetail")}} sod
  on soh.SalesOrderID = sod.SalesOrderID
  left join {{source("Sales","Customer")}}  c
  on soh.CustomerID = c.CustomerID
  left join Production.Product
on sod.ProductID = product.ProductID
  group by 	soh.OrderDate,
	soh.SalesOrderNumber,
	soh.CustomerID,
	Product.Name