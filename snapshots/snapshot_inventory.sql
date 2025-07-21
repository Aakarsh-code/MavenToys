{% snapshot snapshot_inventory %}
    {{
        config(
            target_schema='snapshots',
            unique_key='store_id || \'-\' || product_id',
            strategy='check',
            check_cols=['stock_in_hand']
        )
    }}
 
    select  
        store_id,
        product_id,
        stock_in_hand
    from {{ ref('filtered_inventory') }}
{% endsnapshot %}