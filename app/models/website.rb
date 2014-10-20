class Website < ActiveRecord::Base
  
  validates_uniqueness_of :url
  validates_presence_of :title
  validates :url, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\Z/ix, message: 'URL needs to be valid'}

end
