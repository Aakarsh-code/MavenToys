with 

source as (
    
    select * from {{ source('PUBLIC','PRODUCT') }}

),

renamed as (

    select 

        PRODUCT_ID,
        PRODUCT_NAME as Name,
        PRODUCT_CATEGORY as Category,
        PRODUCT_COST as Cost,
        PRODUCT_PRICE as Price
        
    from source

    )

    select * from renamed