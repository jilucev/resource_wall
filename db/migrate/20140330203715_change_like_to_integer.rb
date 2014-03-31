class ChangeLikeToInteger < ActiveRecord::Migration
  def change
    change_column(:reviews, :review_likes, :integer)
    change_column(:reviews, :review_dislikes, :integer)

  end
end
