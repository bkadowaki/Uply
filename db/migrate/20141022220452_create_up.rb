class CreateUp < ActiveRecord::Migration
  def change
    create_table :ups do |t|
      t.integer :website_id
      t.integer :user_id
      t.timestamps
    end
  end
end
