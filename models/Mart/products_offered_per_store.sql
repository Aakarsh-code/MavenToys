SELECT
    i.STORE_ID,
    s.STORE_NAME,
    COUNT(DISTINCT i.PRODUCT_ID) AS products_offered
FROM
    {{ ref('filtered_inventory') }} i
JOIN
    {{ ref('filtered_stores') }} s ON i.STORE_ID = s.STORE_ID
WHERE
    i.STOCK_ON_HAND > 0
GROUP BY
    i.STORE_ID, s.STORE_NAME
ORDER BY
    i.STORE_ID
    