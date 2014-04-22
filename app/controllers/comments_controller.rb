class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @post = Post.where(:id => params[:post_id]).first
    @comment = @post.comments.new(:user_id => current_user.id, :status => params[:status], :image => params[:image])
    if @comment.save
      flash[:notice] = "Comment created."
      redirect_to home_index_path
    else
      flash[:notice] = "Please try later."
      redirect_to home_index_path
    end  
  end

end
