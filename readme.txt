Source: https://www.kaggle.com/datasets/arnabchaki/popular-video-games-1980-2023

Video games table
- id, title, release_date, rating, summary

Teams table ( many to many with with video games )
- id, name

Teams (joiner table)
video_game_id, team_id

Genres table ( many to many with video games )
- id, name

Genres (joiner table)
-video_game_id, genre_id

Rewies table ( 1 to many with video games )
- id, game_id, content