class Post < ActiveRecord::Base
 
  belongs_to :user
  attr_accessible :comment, :image, :number_of_likes, :post, :status
  mount_uploader :image, ImageUploader
end
