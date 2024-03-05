class AboutController < ApplicationController
  def index
    @data_sources_info = "The dataset used for this project is a collection of video game information dating from 1980 to 2023. It provides data such as release dates, average ratings, developer teams, genres, and more. This dataset is sourced from Kaggle web site (https://www.kaggle.com/datasets/arnabchaki/popular-video-games-1980-2023).
                          The data can be devided into 4 tables. The Games table will have the following columns:id, title, release_date, rating, summary.
                          Teams table will have many to many relation with video games table and contain id and team name columns.
                          Genres table will also have many to many relation with video games table and have id and genre name columns.
                          Latly, the Rewies table has 1 to many relation with video games table and should have id, game_id, and content as columns."

    @erd_description = "Below is the Entity-Relationship Diagram for this project. It represents the relationships between different tables in our database. It visualizes how data entities are connected and structured."

    @erd_image_path = 'erd.png'
  end
end
