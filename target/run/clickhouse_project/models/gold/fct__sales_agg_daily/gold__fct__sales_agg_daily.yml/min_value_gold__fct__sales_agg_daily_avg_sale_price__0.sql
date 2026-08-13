
    
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    SELECT
        *
    FROM `gold`.`fct__sales_agg_daily`
    WHERE avg_sale_price < 0


  
  
    ) dbt_internal_test