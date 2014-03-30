class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  # after_create :increase_likes_counter

  # def increase_likes_counter
  #   review = Review.find_by(self.review_id)
  #   user = review.user_id
  #   likes = self.likes_counter += 1
  #   review.save
  # end
end