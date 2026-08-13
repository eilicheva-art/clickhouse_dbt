
    
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    SELECT
        *
    FROM `silver`.`ecommerce__order_items`
    WHERE delivery_days < 0


  
  
    ) dbt_internal_test