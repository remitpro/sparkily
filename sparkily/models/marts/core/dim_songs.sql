SELECT
    artist_id,
    song_id,
    title,
    duration,
    year
FROM {{ ref('stg_songs') }}