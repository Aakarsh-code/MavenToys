with base as (
    select * from {{ ref('stg_sales') }}
)
select
    SALE_ID,
    cast(DATE as date) as sale_date,
    STORE_ID,
    PRODUCT_ID,
    coalesce(UNITS, 0) as units
from base