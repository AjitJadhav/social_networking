class PostsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end

  def new 
    @post = Post.new
    
    respond_to do |format|
      format.html 
    end
  end 

  def create 
    @user = User.find(params[:user_id])
    @post = @user.posts.create(params[:post])
    
    if @post.save
      flash[:notice] = "Post was created successfully."
      redirect_to home_index_path
    end  
  end
  
  def edit 
  end
  
  def update
  end
  
  def destroy
  end
  
  def show
    @posts = Post.select(:status).where("user_id => ?",params[:user_id]).orderby(created_at: :desc)
  end
  
end
