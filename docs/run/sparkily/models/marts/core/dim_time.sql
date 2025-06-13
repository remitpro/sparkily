
  
    USE [Sparkily];
    USE [Sparkily];
    
    

    

    
    USE [Sparkily];
    EXEC('
        create view "dw"."dim_time__dbt_tmp__dbt_tmp_vw" as -- models/marts/core/dim_time.sql

WITH base AS (
    SELECT *
    FROM "Sparkily"."stg"."stg_log_data"
    WHERE page = ''NextSong''
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

SELECT DISTINCT * FROM dim_time;
    ')

EXEC('
            SELECT * INTO "Sparkily"."dw"."dim_time__dbt_tmp" FROM "Sparkily"."dw"."dim_time__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS dw.dim_time__dbt_tmp__dbt_tmp_vw')



    
    use [Sparkily];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dw_dim_time__dbt_tmp_cci'
        AND object_id=object_id('dw_dim_time__dbt_tmp')
    )
    DROP index "dw"."dim_time__dbt_tmp".dw_dim_time__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX dw_dim_time__dbt_tmp_cci
    ON "dw"."dim_time__dbt_tmp"

   


  