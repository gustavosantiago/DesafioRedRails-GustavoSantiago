class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end

  def see_tweets
    @tweets = current_user.tweets.order(created_at: :desc)
  end

  def see_profile
    @user = User.find(params[:user_id])
  end

  def followers
    @users = current_user.followers
  end

  def following
    @users = current_user.following
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_activities_path(@user), notice: t('controllers.users.notice_create') }
      else
        format.html { render :new, alert: t('controllers.users.alert_create') }
      end
    end
  end

  def edit
    if @user.profile.nil?
      @user.build_profile
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        bypass_sign_in(@user)
        format.html { redirect_to user_activities_path(@user), notice: t('controllers.users.notice_update') }
      else
        format.html { render :edit, alert: t('controllers.users.alert_update') }
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
