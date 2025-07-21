{% snapshot snapshot_stores %}
    {{
        config(
            target_schema='snapshots',
            unique_key='store_id',
            strategy='check',
            check_cols=['store_name','city','location','open_date']
        )
    }}
 
    select
        store_id, store_name, city,location, open_date
    from {{ ref('filtered_stores') }}
{% endsnapshot %}