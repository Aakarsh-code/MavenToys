with 

source as (
    
    select * from {{ source('PUBLIC','DATA_DICTIONARY') }}

),

cleaned as (
    
    select 
        C1 as table_name,
        C2 as field_name,
        C3 as description
    from source
    where C1 != 'Table'
    and C1 is not null

)

select * from cleaned