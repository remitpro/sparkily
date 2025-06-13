
  
    USE [Sparkily];
    USE [Sparkily];
    
    

    

    
    USE [Sparkily];
    EXEC('
        create view "dw"."dim_songs__dbt_tmp__dbt_tmp_vw" as SELECT
    artist_id,
    song_id,
    title,
    duration,
    year
FROM "Sparkily"."stg"."stg_songs";
    ')

EXEC('
            SELECT * INTO "Sparkily"."dw"."dim_songs__dbt_tmp" FROM "Sparkily"."dw"."dim_songs__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS dw.dim_songs__dbt_tmp__dbt_tmp_vw')



    
    use [Sparkily];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dw_dim_songs__dbt_tmp_cci'
        AND object_id=object_id('dw_dim_songs__dbt_tmp')
    )
    DROP index "dw"."dim_songs__dbt_tmp".dw_dim_songs__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX dw_dim_songs__dbt_tmp_cci
    ON "dw"."dim_songs__dbt_tmp"

   


  