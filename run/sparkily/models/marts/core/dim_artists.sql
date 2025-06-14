
  
    USE [Sparkily];
    USE [Sparkily];
    
    

    

    
    USE [Sparkily];
    EXEC('
        create view "dw"."dim_artists__dbt_tmp__dbt_tmp_vw" as -- models/marts/core/dim_artists.sql

SELECT DISTINCT
    artist_id,
    artist_name,
    artist_location,
    artist_latitude,
    artist_longitude
FROM "Sparkily"."stg"."stg_songs";
    ')

EXEC('
            SELECT * INTO "Sparkily"."dw"."dim_artists__dbt_tmp" FROM "Sparkily"."dw"."dim_artists__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS dw.dim_artists__dbt_tmp__dbt_tmp_vw')



    
    use [Sparkily];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dw_dim_artists__dbt_tmp_cci'
        AND object_id=object_id('dw_dim_artists__dbt_tmp')
    )
    DROP index "dw"."dim_artists__dbt_tmp".dw_dim_artists__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX dw_dim_artists__dbt_tmp_cci
    ON "dw"."dim_artists__dbt_tmp"

   


  