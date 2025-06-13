
WITH source AS (
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
    FROM {{ source('sparkily', 'song_data') }}
)

SELECT *
FROM source