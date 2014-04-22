class HomeController < ApplicationController
  before_filter :authenticate_user! 
  before_filter :all_friends_posts, :only => :index
 
  def index
  end
  
  def create
  end
  
  def show
  end 
  
  def new
  end
  
  private 
  
  def all_friends_posts 
    f1 = current_user.friends.where("request_accepted = ?", true).pluck(:friend_with)
    f2 = Friend.where("friend_with = ? and request_accepted = ?", current_user.id, true).pluck(:user_id)
    @friend_ids = f1 + f2 << current_user.id
    @posts = Post.where("user_id in (?) and is_comment = ?",@friend_ids, false).order("created_at DESC")
  end
end
