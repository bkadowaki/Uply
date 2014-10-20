class Comment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :website

  validates_presence_of :text
end
