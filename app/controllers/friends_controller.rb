class FriendsController < ApplicationController
  
  def index
    @friend_ids = current_user.friends
    friends = @friend_ids.map(&:friend_with)
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
end
