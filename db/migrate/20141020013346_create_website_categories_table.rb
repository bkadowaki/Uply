class CreateWebsiteCategoriesTable < ActiveRecord::Migration
  def change
    create_table :website_categories do |t|
      t.integer :category_id
      t.integer :website_id
      t.timestamps
    end
  end
end
