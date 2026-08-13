
    
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select sales_date
from `gold`.`fct__sales_agg_daily`
where sales_date is null



  
  
    ) dbt_internal_test