

WITH
	toDateTime(now()) AS load_dttm
SELECT
    id
    , order_id
    , user_id
    , product_id
    , CAST(status AS LowCardinality(String)) AS status
    , toDateTime(created_at) AS created_at
    , toDateTime(shipped_at) AS shipped_at
    , toDateTime(delivered_at) AS delivered_at
    , toDateTime(returned_at) AS returned_at
    , sale_price
	
    , load_dttm AS _loaded_at
FROM `raw`.`ecommerce__order_items`