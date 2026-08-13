
        
  
    
    
    
        
         


        insert into `gold`.`fct__sales_agg_daily`
        ("sales_date", "orders_count", "order_items_count", "revenue", "total_cost", "total_profit", "avg_sale_price", "avg_profit", "avg_delivery_days", "returned_items_count", "returned_revenue", "last_order_item_created_at", "_loaded_at")

WITH sales_detail AS (
    SELECT
        toDate(order_item_created_at) AS sales_date,
        order_item_created_at,
        order_id,
        order_item_id,
        sale_price,
        cost,
        profit,
        delivery_days,
        is_returned
    FROM `gold`.`fct__sales_detail`
    
)

SELECT
    -- Измерения
    sales_date,
    -- Метрики заказов
    countDistinct(order_id) AS orders_count,
    count() AS order_items_count,
    sum(sale_price) AS revenue,
    sum(cost) AS total_cost,
    sum(profit) AS total_profit,
    avg(sale_price) AS avg_sale_price,
    avg(profit) AS avg_profit,
    avg(delivery_days) AS avg_delivery_days,
    countIf(is_returned = 1) AS returned_items_count,
    sumIf(sale_price, is_returned = 1) AS returned_revenue,
    
    max(order_item_created_at) AS last_order_item_created_at,
    now() AS _loaded_at
FROM sales_detail
GROUP BY sales_date
  
    