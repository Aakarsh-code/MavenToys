{% snapshot snapshot_products %}
    {{
        config(
            target_schema='snapshots',
            unique_key='product_id',
            strategy='check',
            check_cols=['product_name', 'category', 'cost', 'price']
        )
    }}
 
    select
        product_id,
        product_name,
        category,
        cost,
        price
    from {{ ref('filtered_product') }}
{% endsnapshot %}