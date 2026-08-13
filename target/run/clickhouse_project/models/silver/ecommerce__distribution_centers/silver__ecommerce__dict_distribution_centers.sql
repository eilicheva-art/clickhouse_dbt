CREATE OR REPLACE DICTIONARY `silver`.`ecommerce__dict_distribution_centers` 
  
  (id Int32,name String)
  
    primary key id
  SOURCE(
      CLICKHOUSE(
      user 'user'
      password 'password'
      
        query "

SELECT
    id,
    name
FROM `bronze`.`ecommerce__distribution_centers`"
      )

    )
  LAYOUT(HASHED())
  LIFETIME(0)
