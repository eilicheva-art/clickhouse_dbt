

WITH
	toDateTime(now()) AS load_dttm
SELECT
    id
    , first_name
    , last_name
    , email
    , age
    , CAST(gender AS LowCardinality(String)) AS gender
    , CAST(state AS LowCardinality(String)) AS state
    , street_address
    , postal_code
    , CAST(city AS LowCardinality(String)) AS city
    , CAST(country AS LowCardinality(String)) AS country
    , CAST(traffic_source AS LowCardinality(String)) AS traffic_source
    , toDateTime(created_at) AS created_at
	
    , load_dttm AS _loaded_at
FROM `raw`.`ecommerce__users`