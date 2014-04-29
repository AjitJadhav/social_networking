class LikesController < ApplicationController
  respond_to :html, :js
  
  def index
  end
  
  def create
    @post = Post.where("id = ?", params[:post_id]).first
    total_likes = @post.number_of_likes
    if params[:unlike]
      like = @post.likes.where(:user_id => current_user.id)
      like.delete_all
      @post.update_attribute(:number_of_likes, total_likes - 1 )
      flash.now[:error] = "Post unliked."
    else
      @post.update_attribute(:number_of_likes, total_likes + 1 )
      like = @post.likes.new(:user_id => current_user.id)
      if like.save
        flash.now[:notice] = "Post liked."
      else
        flash[:error] = 'Something went wrong'  
      end  
    end  
  end 
  
end
