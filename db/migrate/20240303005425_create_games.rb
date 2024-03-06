class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :title
      t.datetime :release_date
      t.float :rating
      t.text :summary

      t.timestamps
    end
  end
end
