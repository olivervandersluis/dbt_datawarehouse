{{config(alias="SOD")}}
select * from {{source("Sales","SalesOrderDetail")}} 