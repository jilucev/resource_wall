class AddReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :user_id
      t.string :song_id
      t.string :review_upvotes
      t.string :review_downvotes 

      t.timestamps
    end
  end
end
