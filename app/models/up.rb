class Up < ActiveRecord::Base

  belongs_to :user
  belongs_to :website
  validates_uniqueness_of :user_id, scope: [:website_id]
end
