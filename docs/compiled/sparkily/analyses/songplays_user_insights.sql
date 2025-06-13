-- analyses/songplays_user_insights.sql

/*
    Analysis: Users Listening Behavior
    Purpose: Help the analytics team understand which users are listening to which songs,
             including artist and song metadata.
*/

SELECT 
    sp.user_agent,
    u.first_name,
    u.last_name,
    s.title,
    s.duration,
    a.artist_name
FROM "Sparkily"."dw"."fact_songplays" AS sp
JOIN "Sparkily"."dw"."dim_users" AS u 
    ON sp.user_id = u.user_id
JOIN "Sparkily"."dw"."dim_songs" AS s 
    ON sp.song_id = s.song_id
JOIN "Sparkily"."dw"."dim_artists" AS a 
    ON sp.artist_id = a.artist_id