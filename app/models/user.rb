class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :email, :name, :password, :password_confirmation
    
  validates :name, :presence => true,
                  :format => {:with => /\A[a-zA-Z\s]+\Z/, :message => " must contain only letters"}
                  
  validates :email, :presence => true, :uniqueness => true,
                   :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => " format is abc@def.com"} 
  
  validates :password, :presence => true,
                      :length => {:minimum => 8, :message => "minimum length for password is 8 character"}
                      
  
  validates_confirmation_of :password, :if => :password_changed?           
  
  has_many :posts
  has_many :friends
end
