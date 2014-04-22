class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :date_of_birth, :email, :name, :password, :password_confirmation          
  
  has_many :posts
  has_many :friends, :conditions => {:request_accepted => false}
  has_many :pending_friend_request, :class_name => "Friend", :foreign_key => "user_id", :conditions => {:request_accepted => true }
  
  scope :friend_of, ->(user) {
    joins(:friends).where("friends.user_id = ? OR friends.friend_with = ?", user.id, user.id)
  }

end
