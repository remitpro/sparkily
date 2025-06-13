
  
    USE [Sparkily];
    USE [Sparkily];
    
    

    

    
    USE [Sparkily];
    EXEC('
        create view "dw"."fact_songplays__dbt_tmp__dbt_tmp_vw" as -- models/marts/core/fact_songplays.sql

WITH base AS (
    SELECT *
    FROM "Sparkily"."stg"."stg_log_data"
    WHERE page = ''NextSong''
),

song_match AS (
    SELECT
        b.ts AS start_time,
        CAST(b.userId AS INT) AS user_id,
        b.level,
        s.song_id,
        a.artist_id,
        b.sessionId AS session_id,
        b.location,
        b.userAgent AS user_agent
    FROM base b
    LEFT JOIN "Sparkily"."dw"."dim_songs" s
        ON b.song = s.title
        AND ABS(b.length - s.duration) < 2  -- handles small float precision issues
    LEFT JOIN "Sparkily"."dw"."dim_artists" a
        ON b.artist = a.artist_name
)

SELECT
    ROW_NUMBER() OVER (ORDER BY start_time) AS songplay_id,  -- acts like SERIAL
    CAST(start_time AS DATETIME) AS start_time,
    user_id,
    level,
    song_id,
    artist_id,
    session_id,
    location,
    user_agent
FROM song_match
WHERE user_id IS NOT NULL;
    ')

EXEC('
            SELECT * INTO "Sparkily"."dw"."fact_songplays__dbt_tmp" FROM "Sparkily"."dw"."fact_songplays__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS dw.fact_songplays__dbt_tmp__dbt_tmp_vw')



    
    use [Sparkily];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dw_fact_songplays__dbt_tmp_cci'
        AND object_id=object_id('dw_fact_songplays__dbt_tmp')
    )
    DROP index "dw"."fact_songplays__dbt_tmp".dw_fact_songplays__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX dw_fact_songplays__dbt_tmp_cci
    ON "dw"."fact_songplays__dbt_tmp"

   


  