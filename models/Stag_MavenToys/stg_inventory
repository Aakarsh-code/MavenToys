with 

source as (
    
    select * from {{ source('PUBLIC','INVENTORY') }}

),

renamed as (

    select 

        STORE_ID,
        PRODUCT_ID,
        STOCK_ON_HAND
        
    from source

    )

    select * from renamed