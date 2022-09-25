{{ 
    dbt_utils.date_spine(
    datepart = "day",
    start_date = "DATEFROMPARTS(2022, 1,1)",
    end_date='dateadd(week, 1, getdate())'
    )
}}