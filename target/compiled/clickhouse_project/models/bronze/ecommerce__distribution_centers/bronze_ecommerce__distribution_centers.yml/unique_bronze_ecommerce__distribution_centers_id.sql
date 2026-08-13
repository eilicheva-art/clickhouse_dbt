
    
    

select
    id as unique_field,
    count(*) as n_records

from `bronze`.`ecommerce__distribution_centers`
where id is not null
group by id
having count(*) > 1


