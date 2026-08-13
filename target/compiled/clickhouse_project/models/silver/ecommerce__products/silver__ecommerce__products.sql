

WITH
    toDateTime(now()) AS load_dttm
    , 'ecommerce' AS _source
SELECT
    id
    , cost
    , category
    , name
    , brand
    , retail_price
    , department
    , sku
    , distribution_center_id
    , dictGet('silver.ecommerce__dict_distribution_centers', 'name', distribution_center_id) AS distribution_center_name
    , retail_price - cost as profit
    
    , load_dttm AS _loaded_at
    , _source
FROM `bronze`.`ecommerce__products`
WHERE cost > 0