with base as (
    select * from {{ ref('stg_calender') }}
)

select
    date,
    extract(day from date) as day,
    extract(month from date) as month,
    extract(year from date) as year
from base