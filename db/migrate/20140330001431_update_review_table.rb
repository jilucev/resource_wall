class UpdateReviewTable < ActiveRecord::Migration
  def change
    rename_column(:reviews, :song_id, :resource_id)
  end
end
