class Like < ActiveRecord::Base
  belongs_to :post
  has_one :user
  attr_accessible :user_id
end
