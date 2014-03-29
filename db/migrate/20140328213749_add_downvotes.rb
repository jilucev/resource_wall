class AddDownvotes < ActiveRecord::Migration
  def change
    create_table :downvotes do |t|
      t.integer "user_id"
      t.integer "resource_id"

      t.timestamps
    end
  end
end
 
