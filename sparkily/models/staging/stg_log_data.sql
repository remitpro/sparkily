-- models/staging/stg_log_data.sql

WITH source AS (
    SELECT
        [artist],
        [auth],
        [firstName],
        [gender],
        [itemInSession],
        [lastName],
        [length],
        [level],
        [location],
        [method],
        [page],
        [registration],
        [sessionId],
        [song],
        [status],
        [ts],
        [userAgent],
        [userId]
    FROM {{ source('sparkily', 'log_data') }}
)

SELECT *
FROM source
