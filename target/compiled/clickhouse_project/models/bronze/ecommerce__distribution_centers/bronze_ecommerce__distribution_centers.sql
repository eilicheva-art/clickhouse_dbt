

WITH
	toDateTime(now()) AS load_dttm
SELECT
    id
    , name
	
    , load_dttm AS _loaded_at
FROM `raw`.`ecommerce__distribution_centers`