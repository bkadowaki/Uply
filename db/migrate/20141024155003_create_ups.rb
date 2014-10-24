class CreateUps < ActiveRecord::Migration
  def change
    create_table :ups do |t|
      t.integer :user_id
      t.references :upable, polymorphic: true
      t.timestamps
    end
  end
end
