class HomeController < ApplicationController
  before_filter :authenticate_user! 
  before_filter :all_friends_posts, :only => :index
  
  def index
    
  end
  
  def create
    
    @user = current_user[:user_id]
    @post = @user.posts.create(parmas[:post])
     
    if @post.save
      flash.now[:notice] = "your post was successful."
      render :index
    else
      flash.now[:notice] = "post was unsuccessful. Please try again later. "
      render :index
    end
  end
  
  def show
  end 
  
  def new
  end
  
  private 
  
  def all_friends_posts 
    user_friend_with = Friend.select(:friend_with).where("user_id = ? and request_accepted = ?",current_user.id,true)
    user_friend_of = Friend.select(:user_id).where("friend_with = ? and request_accepted = ?",current_user.id,true)
    @posts = current_user.posts.order("created_at DESC")
  end
end
