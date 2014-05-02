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
    @post = current_user.posts.create(params[:post])
    if @post.save
      flash[:notice] = "Post was created successfully."
      redirect_to home_index_path
    else 
      flash[:alert] = "Please provide the status."
      redirect_to home_index_path
    end  
  end
  
  def destroy
    @post = current_user.posts.where(:id => params[:id]).first
    if @post.present? && @post.destroy
      flash[:notice] = "Post has been deleted."
      redirect_to home_index_path
    else 
      flash[:alert] = "You don't have permission for deleting this post."
      redirect_to home_index_path
    end 
  end   
  
 

end
