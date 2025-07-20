with base as (
    select * from {{ ref('stg_data_dictionary') }}
)
select
    lower(table_name) as table_name,
    lower(field_name) as field_name,
    description
from base