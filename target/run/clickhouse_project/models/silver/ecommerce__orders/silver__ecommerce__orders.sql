
  
    
  
    
    
    
        
         


        insert into `silver`.`ecommerce__orders`
        ("order_id", "user_id", "status", "created_at", "returned_at", "shipped_at", "delivered_at", "num_of_item", "delivery_days", "is_returned", "_loaded_at", "_source")

WITH
    toDateTime(now()) AS load_dttm
    , 'ecommerce' AS _source
SELECT
    order_id
    , user_id
    , status
    , created_at
    , returned_at
    , shipped_at
    , delivered_at
    , num_of_item
    , CASE WHEN dateDiff('day', shipped_at, delivered_at) >= 0 THEN dateDiff('day', shipped_at, delivered_at) ELSE 0 END AS delivery_days
    , CASE WHEN returned_at = '1970-01-01 00:00:00' THEN 0 ELSE 1 END AS is_returned
    
    , load_dttm AS _loaded_at
    , _source
FROM `bronze`.`ecommerce__orders`
WHERE created_at <= now()
  
  
  