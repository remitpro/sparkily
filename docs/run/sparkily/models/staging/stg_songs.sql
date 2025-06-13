USE [Sparkily];
    
    

    

    
    USE [Sparkily];
    EXEC('
        create view "stg"."stg_songs__dbt_tmp" as WITH source AS (
    SELECT
        [num_songs],
        [artist_id],
        [artist_latitude],
        [artist_longitude],
        [artist_location],
        [artist_name],
        [song_id],
        [title],
        [duration],
        [year]
    FROM "Sparkily"."dev"."song_data"
)

SELECT *
FROM source;
    ')

