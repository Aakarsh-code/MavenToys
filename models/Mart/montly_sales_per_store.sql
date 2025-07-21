WITH monthly_sales AS (
    SELECT
        s.store_id,
        TO_CHAR(s.sale_date, 'YYYY-MM') AS year_month,
        SUM(s.units * p.price) AS total_sales
    FROM
        {{ ref('filtered_sales') }} s
    JOIN
        {{ ref('filtered_product') }} p ON s.product_id = p.product_id
    GROUP BY
        s.store_id,
        year_month
)

SELECT
    ms.store_id,
    st.store_name,
    ms.year_month,
    ROUND(ms.total_sales, 2) AS total_sales,
    ROUND(
        SUM(ms.total_sales) OVER (
            PARTITION BY ms.store_id
            ORDER BY ms.year_month
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ), 2
    ) AS running_total_sales
FROM
    monthly_sales ms
JOIN
    {{ ref('filtered_stores') }} st ON ms.store_id = st.store_id
ORDER BY
    ms.store_id, ms.year_month