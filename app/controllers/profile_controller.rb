class ProfileController < ApplicationController
 # before_filter :authenticate_user
  
  private
  
  def authenticate_user
    if session[:current_user].blank?
      flash[:notice] = "Please login before continue"
      redirect_to login_index_path
    end
  end
  
  def index
  end
  
  def wall
  end
end
