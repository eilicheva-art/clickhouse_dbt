
    
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    country as unique_field,
    count(*) as n_records

from `silver`.`ecommerce__dict_country_city`
where country is not null
group by country
having count(*) > 1



  
  
    ) dbt_internal_test