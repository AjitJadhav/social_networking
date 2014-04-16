class Friend < ActiveRecord::Base
  belongs_to :user
  attr_accessible :friend_with, :request_accepted
end
