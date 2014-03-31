class AddLikesTable < ActiveRecord::Migration
  def change
     create_table :likes do |t|
      t.integer :user_id
      t.string :review_id
      t.string :likes_counter
      t.timestamps
    end
  end
end
