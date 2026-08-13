
    
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    SELECT
        *
    FROM `gold`.`fct__sales_agg_daily`
    WHERE returned_items_count < 0


  
  
    ) dbt_internal_test