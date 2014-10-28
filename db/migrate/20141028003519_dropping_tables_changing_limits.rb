class DroppingTablesChangingLimits < ActiveRecord::Migration
  def change
  	remove_column :websites, :title, :string
  	remove_column :websites, :description, :string
  	add_column :websites, :title, :text, :limit => nil
  	add_column :websites, :description, :text, :limit => nil
  end
end
