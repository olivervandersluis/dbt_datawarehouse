{% snapshot Historized_SalesOrderHeader %}

{{
    config(
      target_database='AdventureWorks2019',
      target_schema='History',
      unique_key='SalesOrderID',

      strategy='timestamp',
      updated_at='ModifiedDate',
	  
	  as_columnstore= false
    )
}}

select * from {{source('Sales','SalesOrderHeader')}}

{% endsnapshot %}