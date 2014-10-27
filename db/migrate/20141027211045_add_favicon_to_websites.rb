class AddFaviconToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :favicon, :string
  end
end
