USE [Sparkily];
    
    

    

    
    USE [Sparkily];
    EXEC('
        create view "stg"."stg_log_data__dbt_tmp" as -- models/staging/stg_log_data.sql

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
    FROM "Sparkily"."dev"."log_data"
)

SELECT *
FROM source;
    ')

