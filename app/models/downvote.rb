class Downvote < ActiveRecord::Base
  belongs_to :user
  belongs_to :resource

  after_create :decrease_user_points

  def decrease_user_points
    resource = Resource.find_by(self.resource_id)
    user = resource.user
    user.points -= 1
    user.save
  end
end