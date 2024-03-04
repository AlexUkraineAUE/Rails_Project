class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :game_id
      t.string :content

      t.timestamps
    end
  end
end
