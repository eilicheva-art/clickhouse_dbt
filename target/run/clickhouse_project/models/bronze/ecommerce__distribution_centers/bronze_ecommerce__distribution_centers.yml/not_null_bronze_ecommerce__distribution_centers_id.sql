
    
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id
from `bronze`.`ecommerce__distribution_centers`
where id is null



  
  
    ) dbt_internal_test