class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :website
  has_many :ups, as: :upable
  validates_presence_of :text
  
  ### Determine the top comment based on the gravity/time algorithm that was used on
  ### the com_score method in the website model.
  
  def comment_score 
    c = DateTime.parse(self.created_at.to_datetime.to_s)
    t = (DateTime.now - c).to_i
    p = self.ups.count
  
    (p)/((t+2)**(0.8)) 
  end
end
