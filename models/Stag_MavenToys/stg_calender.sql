with 

source as (
    
    select * from {{ source('PUBLIC','CALENDER') }}

),

renamed as (

    select 

        Date as date
        
    from source

    )

    select * from renamed