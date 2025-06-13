-- models/marts/core/dim_artists.sql

SELECT DISTINCT
    artist_id,
    artist_name,
    artist_location,
    artist_latitude,
    artist_longitude
FROM "Sparkily"."stg"."stg_songs"