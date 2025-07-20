with base as (
    select * from {{ ref('stg_inventory') }}
)
select
    STORE_ID,
    PRODUCT_ID,
    coalesce(STOCK_ON_HAND, 0) as stock_on_hand
from base