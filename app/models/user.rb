class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :date_of_birth, :email, :name, :password, :password_confirmation
    
  #validates :name, :presence => true,
  #                :format => {:with => /\A[a-zA-Z\s]+\Z/, :message => " must contain only letters"}
                  
  #validates :email, :presence => true, :uniqueness => true,
  #                 :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => " format is abc@def.com"} 
  
  #validates :password, :presence => true,
  #                    :length => {:minimum => 8, :message => "minimum length for password is 8 character"}
                      
  
  #validates_confirmation_of :password, :if => :password_changed?           
  
  has_many :posts
  has_many :friends
end
