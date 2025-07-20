with base as (
    select * from {{ ref('stg_product') }}
)
select
    PRODUCT_ID,
    trim(Name) as product_name,
    upper(Category) as category,
    -- Remove $ and cast to number
    cast(replace(Cost, '$', '') as float) as cost,
    cast(replace(Price, '$', '') as float) as price,
    cast(replace(Price, '$', '') as float) - cast(replace(Cost, '$', '') as float) as profit
from base