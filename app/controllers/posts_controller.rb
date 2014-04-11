class PostsController < ApplicationController
  def index
  end

  def new 
    @post = Post.new
    
    respond_to do |format|
      format.html 
    end
  end 

  def create 
   # debugger
    @user = User.find(params[:user_id])
    @post = @user.posts.create(params[:post])
    
    if @post.save
      flash[:notice] = "Post was created successfully."
    end  
  end
  
  def edit 
  end
  
  def update
  end
  
  def destroy
  end
  
  def show
  end
  
end
