class Post < ActiveRecord::Base
  attr_accessible :is_comment, :image, :number_of_likes, :post_id, :status,
    :user_id
  
  has_many :likes
  has_many :comments, :class_name => "Post", :foreign_key => :post_id, :conditions => {:is_comment => true}
  belongs_to :post, :class_name => "Post", :foreign_key => :post_id
  belongs_to :user
  
  mount_uploader :image, ImageUploader
end
