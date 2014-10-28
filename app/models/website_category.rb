class WebsiteCategory < ActiveRecord::Base

  belongs_to :website
  belongs_to :category
  
  validates_uniqueness_of :category, scope: [:website] 
end
