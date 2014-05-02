class HomeController < ApplicationController
  before_filter :authenticate_user! 
  before_filter :all_friends_posts, :only => [:index, :search]
 
  def index
    @posts_to_show = @posts
  end
  
  def create
  end
  
  def show
  end 
  
  def new
  end
  
  def search
    user_ids = @posts.pluck(:user_id).uniq  
    user = User.where("first_name ilike ? AND id in (?)", "%#{params[:search_post]}%", user_ids).first
    if user.present?
      posts_of_user = user.posts.where("is_comment = ?", false).order("created_at DESC") 
    end
    status_containing_keyword = Post.where("user_id in (?) and status ilike ?", @friend_ids, "%#{params[:search_post]}%")
    @posts_to_show = (posts_of_user.to_a + status_containing_keyword.to_a).uniq
  end
  
  
  private 
  
  def all_friends_posts 
    f1 = current_user.friends.where("request_accepted = ?", true).pluck(:friend_with)
    f2 = Friend.where("friend_with = ? and request_accepted = ?", current_user.id, true).pluck(:user_id)
    @friend_ids = f1 + f2 << current_user.id
    @posts = Post.where("user_id in (?) and is_comment = ?",@friend_ids, false).order("created_at DESC")
  end
end
