
    
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    SELECT
        *
    FROM `silver`.`ecommerce__products`
    WHERE length(sku) != 32


  
  
    ) dbt_internal_test