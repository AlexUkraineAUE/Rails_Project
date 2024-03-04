class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :title
      t.datetime :release_date
      t.float :rating
      t.integer :times_listed
      t.integer :number_of_reviews
      t.text :summary
      t.integer :plays
      t.integer :playing
      t.integer :backlogs
      t.integer :wishlist

      t.timestamps
    end
  end
end
