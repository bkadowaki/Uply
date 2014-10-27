class AddFaviconToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :favicon, :string
    add_column :websites, :screenshot, :string
  end
end
