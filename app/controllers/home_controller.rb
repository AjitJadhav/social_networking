class HomeController < ApplicationController
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
    if user_signed_in?
      @posts = current_user.posts.order("created_at DESC")
    end
  end
end
