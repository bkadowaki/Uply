class AddUserIdWebsiteIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :website_id, :integer
    add_column :comments, :user_id, :integer
  end
end
