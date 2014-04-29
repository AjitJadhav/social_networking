class FriendsController < ApplicationController
  include ApplicationHelper  
  before_filter :authenticate_user!
  before_filter :all_friends, :only => :index
  
  def index
    @friends = User.where("id in (?)", @friend_ids)
  end
  
  def add_friend
    if  current_user.friends.create(:friend_with => params[:friend_id],:request_accepted => false)
      flash[:notice] = "Friend request has been sent."
      redirect_to users_path
    else  
      flash[:error] = "Friend request not sent. Please try again later"
    end
  end
  
  def respond_request
    current_friend_id = Friend.select(:id).where("user_id = ? and friend_with = ?", params[:friend_id], current_user.id)
    if Friend.where("friend_with = ? and user_id = ? and request_accepted = ?",current_user.id, params[:friend_id], true).present?
      Friend.delete(current_friend_id) 
      flash[:alert] = "Friend removed from your list."
    else
      Friend.update(current_friend_id,:request_accepted => "true")
      flash[:notice] = "Friend request accepted."
    end
    redirect_to friends_path
  end
  
  private
  def all_friends
    f1 = current_user.friends.pluck(:friend_with)
    f2 = Friend.where("friend_with = ?", current_user.id).pluck(:user_id)
    @friend_ids = f1 + f2
  end
  
end
