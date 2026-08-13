CREATE OR REPLACE DICTIONARY `silver`.`ecommerce__dict_country_city` 
  
  (country String,city String)
  
    primary key country
  SOURCE(
      CLICKHOUSE(
      user 'user'
      password 'password'
      
        query "

SELECT
    country,
    city
FROM `seeds`.`country_city`"
      )

    )
  LAYOUT(COMPLEX_KEY_HASHED())
  LIFETIME(0)
