class RefactorLikesDislikes < ActiveRecord::Migration
  def change
    remove_column(:reviews, :review_likes, :integer)
    remove_column(:reviews, :review_dislikes, :integer)
  end
end
