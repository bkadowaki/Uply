class Category < ActiveRecord::Base

  has_many :website_categories
  has_many :websites, through: :website_categories

end
