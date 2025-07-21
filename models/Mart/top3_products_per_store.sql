WITH product_sales AS (
    SELECT
        s.store_id,
        st.store_name,
        s.product_id,
        p.product_name,
        SUM(s.units) AS total_units_sold,
        SUM(s.units * p.profit) AS total_profit_gained
    FROM
        {{ ref('filtered_sales') }} s
    JOIN
        {{ ref('filtered_product') }} p ON s.product_id = p.product_id
    JOIN
        {{ ref('filtered_stores') }} st ON s.store_id = st.store_id
    GROUP BY
        s.store_id, st.store_name, s.product_id, p.product_name
),

ranked_products AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY store_id
            ORDER BY total_units_sold DESC
        ) AS rank_in_store
    FROM product_sales
)

SELECT
    store_id,
    store_name,
    product_id,
    product_name,
    total_units_sold,
    ROUND(total_profit_gained, 2) AS total_profit_gained
FROM ranked_products
WHERE rank_in_store <= 3
ORDER BY store_id, rank_in_store