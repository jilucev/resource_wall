class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :resource
  has_many :likes

  # after_create :increase_likes_counter, if: :like


  # def increase_likes_counter
  #   self.likes.likes_counter += 1
  #   self.likes.likes_counter.save
  # end
end