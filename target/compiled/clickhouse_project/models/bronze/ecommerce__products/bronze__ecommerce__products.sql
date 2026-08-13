

WITH
    toDateTime(now()) AS load_dttm
SELECT
    id
    , cost
    , CAST(category AS LowCardinality(String)) AS category
    , name
    , brand
    , retail_price
    , CAST(department AS LowCardinality(String)) AS department
    , sku
    , distribution_center_id
    , load_dttm AS _loaded_at
FROM `raw`.`ecommerce__products`