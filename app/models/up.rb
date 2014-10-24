class Up < ActiveRecord::Base
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :upable, polymorphic: true
  validates_uniqueness_of :user_id, scope: [:upable_id, :upable_type]
end
