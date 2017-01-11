class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end

  def see_tweets
    @tweets = current_user.tweets.order(created_at: :desc)
  end

  def see_user_profile
    @user = User.find_by(params[:user_id])
  end

  def followers
    @followers = current_user.followers
  end

  def following
    @followings = current_user.following
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation, profile_attributes: [:name, :bio, :avatar])
    end

end
