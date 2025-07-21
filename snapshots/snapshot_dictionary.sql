{% snapshot snapshot_dictionary %}
    {{
        config(
            target_schema='snapshots',
            unique_key='table_name || \'-\' || field',
            strategy='check',
            check_cols=['description']
        )
    }}
 
    select
        "table_name",
        "field_name",
        "description"
    from {{ ref('filtered_data_dictionary') }}
{% endsnapshot %}