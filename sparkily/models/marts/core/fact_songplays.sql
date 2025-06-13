-- models/marts/core/fact_songplays.sql

WITH base AS (
    SELECT *
    FROM {{ ref('stg_log_data') }}
    WHERE page = 'NextSong'
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
    LEFT JOIN {{ ref('dim_songs') }} s
        ON b.song = s.title
        AND ABS(b.length - s.duration) < 2  -- handles small float precision issues
    LEFT JOIN {{ ref('dim_artists') }} a
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
WHERE user_id IS NOT NULL
