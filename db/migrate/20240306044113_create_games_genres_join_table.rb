class CreateGamesGenresJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :games_genres do |t|
      t.belongs_to :game, foreign_key: true
      t.belongs_to :genre, foreign_key: true

      t.timestamps
    end
  end
end
