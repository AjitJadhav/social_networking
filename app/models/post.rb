class Post < ActiveRecord::Base
  
  validates :status, :presence => true
  
  attr_accessible :is_comment, :image, :number_of_likes, :post_id, :status,
    :user_id
  
  has_many :likes, :dependent => :destroy
  has_many :comments, :class_name => "Post", :foreign_key => :post_id, :conditions => {:is_comment => true}
  belongs_to :post, :class_name => "Post", :foreign_key => :post_id
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  scope :all_comments, ->(post) { 
    post.comments.order("created_at asc").limit(5)
  }
end
