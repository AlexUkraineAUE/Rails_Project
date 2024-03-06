class CreateGamesTeamsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :games_teams do |t|
      t.references :game, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
