class User < ActiveRecord::Base

  has_many :upvotes
  has_many :downvotes
  has_many :reviews
  has_many :resources
  has_many :likes

  def already_upvoted?(resource)
    !!self.upvotes.find_by(resource_id: resource.id)
  end

  def already_downvoted?(resource)
    !!self.downvotes.find_by(resource_id: resource.id)
  end

  def already_voted?(resource)
    already_downvoted?(resource) || already_upvoted?(resource)
  end

  # def already_liked?(review)
  #   !!self.likes.find_by(review_id: review.id)
  # end
end