
    
    

select
    sales_date as unique_field,
    count(*) as n_records

from `gold`.`fct__sales_agg_daily`
where sales_date is not null
group by sales_date
having count(*) > 1


