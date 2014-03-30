class ChangeColumnNameReviews < ActiveRecord::Migration
  def change
    rename_column :reviews, :review_upvotes, :review_likes
    rename_column :reviews, :review_downvotes, :review_dislikes
  end
end
