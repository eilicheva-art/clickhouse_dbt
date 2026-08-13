
    
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    SELECT
        *
    FROM `silver`.`ecommerce__users`
    WHERE lower(city) = 'null'


  
  
    ) dbt_internal_test