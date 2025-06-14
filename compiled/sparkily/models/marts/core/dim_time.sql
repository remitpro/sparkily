-- models/marts/core/dim_time.sql

WITH base AS (
    SELECT *
    FROM "Sparkily"."stg"."stg_log_data"
    WHERE page = 'NextSong'
),

converted AS (
    SELECT
        ts,
       --convert datetime  string to datetime
        CAST(ts AS DATETIME) AS start_time
       
    FROM base
),

dim_time AS (
    SELECT
        start_time,
        DATEPART(HOUR, start_time) AS hour,
        DATEPART(DAY, start_time) AS day,
        DATEPART(WEEK, start_time) AS week,
        DATEPART(MONTH, start_time) AS month,
        DATEPART(YEAR, start_time) AS year,
        DATEPART(WEEKDAY, start_time) AS weekday
    FROM converted
)

SELECT DISTINCT * FROM dim_time