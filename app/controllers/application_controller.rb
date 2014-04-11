class ApplicationController < ActionController::Base
  protect_from_forgery 
  
 # before_filter :authenticate_user1, :only => [:show]

  private
  
  def authenticate_user1
    if session[:current_user].present? and params[:id].present? and session[:current_user][:id] != params[:id]
      flash[:notice] = "Please login before continue..........."
      redirect_to login_index_path
    end
  end
  
  
end

