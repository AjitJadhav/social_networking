class User < ActiveRecord::Base
  before_create :customize_name
  
  
  validates :first_name, :presence => true,
                         :format => {:with => /\A[a-zA-Z]+\Z/, :message => "First Name must contain only letters."} 
  
  validates :last_name, :presence => true,
                         :format => {:with => /\A[a-zA-Z]+\Z/, :message => "Last Name must contain only letters."} 
                         
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :date_of_birth, :email, :first_name, :last_name, :password, :password_confirmation          
  
  has_many :likes
  has_many :posts
  has_many :friends, :conditions => {:request_accepted => true}
  has_many :pending_friend_request, :class_name => "Friend", :foreign_key => "user_id", :conditions => {:request_accepted => false }
       
  
  
  def customize_name
    self.first_name = self.first_name.titleize
    self.last_name = self.last_name.titleize
  end
  
  scope :search, ->(search_keyword, friend_ids){
    User.where("id NOT IN (?) AND first_name ilike ? OR last_name ilike ? ", friend_ids, "%#{search_keyword}%", "%#{search_keyword}%")
  }
   
end
