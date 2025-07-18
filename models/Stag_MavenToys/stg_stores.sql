with 

source as (
    
    select * from {{ source('PUBLIC','STORES') }}

),

renamed as (

    select 

        STORE_ID,
        STORE_NAME as NAME,
        STORE_CITY as CITY,
        STORE_LOCATION as LOCATION,
        STORE_OPEN_DATE as OPEN_DATE
        
    from source

    )

    select * from renamed