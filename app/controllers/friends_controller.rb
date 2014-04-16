class FriendsController < ApplicationController
  include ApplicationHelper  
  #before_filter :all_friends, :only => :index
  
  def index
    @friend_ids = Friend.where("friend_with = ?", current_user.id)
    friends = @friend_ids.map(&:user_id)
    @users = User.where("id in (?)",friends) 
  end
  
  def show
  end
  
  def edit
  end
  
  def add_friend
   if current_user.friends.create(:friend_with => params[:friend_id],:request_accepted => false)
      flash[:notice] = "Friend request has been sent."
      redirect_to users_path
   else
      flash[:notice] = "Friend request not sent!!! try later"
   end
  end
  
  def respond_request
    
    current_friend_id = Friend.select(:id).where("user_id = ? and friend_with = ?", params[:friend_id], current_user.id)
    if Friend.where("friend_with = ? and request_accepted = ?",current_user.id, true).present?
      Friend.delete(current_friend_id) 
      flash[:notice] = "friend removed from your list."
    else
      Friend.update(current_friend_id,:request_accepted => "true")
      flash[:notice] = "friend request accepted."
    end
    redirect_to friends_path
  end
  
  def all_friends
    f1 = current_user.friends.where("request_accepted = true")
    f2 = Friend.where("friend_with = ? and request_accepted = ?", current_user.id, true)
    f3 = f1.map(&:friend_with)
    f4 = f2.map(&:user_id)
    @friend_ids = f3 + f4
  end
  
end
