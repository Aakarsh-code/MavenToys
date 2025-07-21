SELECT
    sa.store_id,
    st.store_name,
    ROUND(SUM(sa.units * p.price),2) AS total_sales,
    ROUND(SUM(sa.units * p.profit),2) AS total_profit
FROM
    {{ ref('filtered_sales') }} sa
JOIN
    {{ ref('filtered_product') }} p ON sa.product_id = p.product_id
JOIN
    {{ ref('filtered_stores') }} st ON sa.store_id = st.store_id
GROUP BY
    sa.store_id,
    st.store_name
ORDER BY
    sa.store_id