-- Dimension Tables

CREATE TABLE dim_users (
    user_id INT PRIMARY KEY,
    first_name NVARCHAR(255),
    last_name NVARCHAR(255),
    gender NVARCHAR(10),
    level NVARCHAR(50) NOT NULL
);

CREATE TABLE dim_songs (
    song_id NVARCHAR(50) PRIMARY KEY,
    title NVARCHAR(255),
    artist_id NVARCHAR(50),
    year INT,
    duration FLOAT
);

CREATE TABLE dim_artist (
    artist_id NVARCHAR(50) PRIMARY KEY,
    name NVARCHAR(255),
    location NVARCHAR(255),
    latitude NVARCHAR(50),
    longitude NVARCHAR(50)
);

CREATE TABLE dim_time (
    start_time DATETIME PRIMARY KEY,
    hour INT,
    day INT,
    week INT,
    month INT,
    year INT,
    weekday INT
);

-- Fact Table

CREATE TABLE fact_songplays (
    songplays_id INT IDENTITY(1,1) PRIMARY KEY,
    start_time DATETIME FOREIGN KEY REFERENCES dim_time(start_time),
    user_id INT FOREIGN KEY REFERENCES dim_users(user_id),
    level NVARCHAR(50),
    song_id NVARCHAR(50) FOREIGN KEY REFERENCES dim_songs(song_id),
    artist_id NVARCHAR(50) FOREIGN KEY REFERENCES dim_artist(artist_id),
    session_id INT,
    location NVARCHAR(255),
    user_agent NVARCHAR(MAX)
);


