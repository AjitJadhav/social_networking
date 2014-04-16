class Friend < ActiveRecord::Base
  belongs_to :user
  attr_accessible :friend_with, :request_accepted
  
  scope :accepted_request, lambda{|friend| where("friend_with = ? AND request_accepted = ?", friend, true)}
end
