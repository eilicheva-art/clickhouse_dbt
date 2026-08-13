

WITH
	toDateTime(now()) AS load_dttm
SELECT
	order_id
	, user_id
	, CAST(status AS LowCardinality(String)) AS status
	, toDateTime(created_at) AS created_at
	, toDateTime(returned_at) AS returned_at
	, toDateTime(shipped_at) AS shipped_at
	, toDateTime(delivered_at) AS delivered_at
	, num_of_item
	
	, load_dttm AS _loaded_at
FROM `raw`.`ecommerce__orders`