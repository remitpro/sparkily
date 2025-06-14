
  
    USE [Sparkily];
    USE [Sparkily];
    
    

    

    
    USE [Sparkily];
    EXEC('
        create view "dw"."dim_users__dbt_tmp__dbt_tmp_vw" as -- models/marts/core/dim_users.sql

SELECT DISTINCT
    CAST(userId AS INT) AS user_id,
    firstName AS first_name,
    lastName AS last_name,
    gender,
    level
FROM "Sparkily"."stg"."stg_log_data"
WHERE userId IS NOT NULL AND userId != '''';
    ')

EXEC('
            SELECT * INTO "Sparkily"."dw"."dim_users__dbt_tmp" FROM "Sparkily"."dw"."dim_users__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS dw.dim_users__dbt_tmp__dbt_tmp_vw')



    
    use [Sparkily];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dw_dim_users__dbt_tmp_cci'
        AND object_id=object_id('dw_dim_users__dbt_tmp')
    )
    DROP index "dw"."dim_users__dbt_tmp".dw_dim_users__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX dw_dim_users__dbt_tmp_cci
    ON "dw"."dim_users__dbt_tmp"

   


  