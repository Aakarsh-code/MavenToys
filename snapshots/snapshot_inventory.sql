{% snapshot snapshot_inventory %}
    {{
        config(
            target_schema='snapshots',
            unique_key='STORE_ID || \'-\' || PRODUCT_ID',
            strategy='check',
            check_cols=['stock_on_hand']
        )
    }}
 
    select  
        STORE_ID,
        PRODUCT_ID,
        stock_on_hand
    from {{ ref('filtered_inventory') }}
{% endsnapshot %}