class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :add_friends, :only => [:index, :search]
  
  def index
    
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html      
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to wall_path, :notice => 'User was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def search
    @found = User.where("id NOT IN (?) AND first_name ilike ? OR last_name ilike ? ", @friend_ids, "%#{params[:search_name]}%", "%#{params[:search_name]}%") 
    if @found.present?
    respond_to do |format|
      format.js
    end  
    else
      flash.now[:notice] = "User not found"
      @found = @users
      respond_to do |format|
        format.js
      end
    end
  end
  
  private
  
  def add_friends
    f1 = current_user.friends.pluck(:friend_with)
    f2 = current_user.pending_friend_request.pluck(:friend_with)
    @friend_ids = f1 + f2
    @friend_ids << current_user.id
    @users = User.where("id NOT IN (?)", @friend_ids)
  end
 
  
end

