class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)

    respond_to do |format|
      format.html { redirect_to user_profile_path(user), notice: t('controllers.friendships.notice') + "#{user.profile.name}"}
    end
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)

    respond_to do |format|
      format.html { redirect_to user_profile_path(user), alert: t('controllers.friendships.alert') + "#{user.profile.name}" }
    end
    
  end
end
