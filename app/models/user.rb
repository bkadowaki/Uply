class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :ups
  has_many :websites, through: :ups, source: :upable, source_type: "Website"
  has_many :upd_comments, through: :ups, source: :upable, source_type: "Comment"
  
  def websites_ups_count
    self.ups.where("upable_type = 'Website'").count
  end
  
   def comments_ups_count
    self.ups.where("upable_type = 'Comment'").count
  end
  
  def comments_upd
    self.ups.where("upable_type = 'Comment'")
  end
end
