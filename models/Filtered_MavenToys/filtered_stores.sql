with base as (
    select * from {{ ref('stg_stores') }}
)
select
    STORE_ID,
    trim(replace(NAME, 'Maven Toys ', '')) as store_name,
    upper(CITY) as city,
    upper(LOCATION) as location,
    cast(OPEN_DATE as date) as open_date
from base