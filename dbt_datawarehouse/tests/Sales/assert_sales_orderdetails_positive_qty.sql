{{ config({
	"as_columnstore": false
	}) }}
with orderdetails as
(
select * from {{ref('SalesOrderDetail')}}

)
select SalesOrderID, sum(OrderQty) OrderQty from orderdetails
group by SalesOrderID
having sum(OrderQty)<0