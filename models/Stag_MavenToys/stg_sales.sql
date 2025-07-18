with 

source as (
    
    select * from {{ source('PUBLIC','SALES') }}

),

renamed as (

    select 

        SALE_ID,
        DATE,
        STORE_ID,
        PRODUCT_ID,
        UNITS
        
    from source

    )

    select * from renamed