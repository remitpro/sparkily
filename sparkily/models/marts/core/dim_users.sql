-- models/marts/core/dim_users.sql

SELECT DISTINCT
    CAST(userId AS INT) AS user_id,
    firstName AS first_name,
    lastName AS last_name,
    gender,
    level
FROM {{ ref('stg_log_data') }}
WHERE userId IS NOT NULL AND userId != ''
