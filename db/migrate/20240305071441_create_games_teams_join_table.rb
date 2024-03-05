class CreateGamesTeamsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :games, :teams do |t|
      t.belongs_to :game
      t.belongs_to :team
    end

    add_index :games_teams, [:game_id, :team_id]
    add_index :games_teams, [:team_id, :game_id]
  end
end
