
    
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select country
from `silver`.`ecommerce__dict_country_city`
where country is null



  
  
    ) dbt_internal_test