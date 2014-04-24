class LikesController < ApplicationController
  def index
  end
  
  def create
      post = Post.where("id = ?", params[:post_id]) 
      like = post.first.likes.new(:user_id => current_user.id)
      Post.increment_counter(:number_of_likes, post.first.id)
      if like.save
        flash[:notice] = "Post liked."
        redirect_to home_index_path
      else  
        flash[:notice] = "Like not succied."
        redirect_to home_index_path
      end  
  
  end 
   
  def unlike
    post = Post.where("id = ?", params[:post_id]) 
    unlike = post.first.likes(current_user).delete_all
    Post.decrement_counter(:number_of_likes, post.first.id)
    if unlike.present?
      flash[:notice] = "Post unliked."
      redirect_to home_index_path
    else  
      flash[:notice] = "Unlike not succied."
      redirect_to home_index_path
    end  
  end
end
