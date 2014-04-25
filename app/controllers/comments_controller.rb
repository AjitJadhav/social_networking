class CommentsController < ApplicationController
  respond_to :html, :js
  before_filter :authenticate_user!

  def create
    @post = Post.where(:id => params[:post_id]).first
    @comment = @post.comments.new(:user_id => current_user.id, :status => params[:status], :image => params[:image])
    if @comment.save
    
      flash[:notice] = "Comment created."
      
    else
      flash[:notice] = "Please try later."
      
    end  
    @comments = @post.comments
  end

end
