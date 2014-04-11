class LoginController < ApplicationController
 
  before_filter :authenticate_user, :except => [:index, :authenticate]
  
  
  def index
    @user = User.new
  end
  
  
  
  def authenticate
    @user = User.where("email = ? AND password = ?", params[:user][:email], params[:user ][:password] ).first
    if @user.blank?
      flash.now[:notice] = "Email or password not matched."
      render 'index'
    else 
      session[:current_user] = @user
      redirect_to user_path(@user)
    end
  end
  
  def logout
    session.clear
    flash[:notice] = "You have been signed out."
    redirect_to login_index_path 
  end
  
  def signin
  end
  
  private

  def authenticate_user
 
    if session[:current_user].blank? #or session[:current_user][:id] != params[:id]
      flash[:notice] = "Please login before continue"
      redirect_to login_index_path
    end
  end

  
end
