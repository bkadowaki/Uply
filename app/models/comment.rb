class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :website
  has_many :ups, as: :upable
  validates_presence_of :text
end
