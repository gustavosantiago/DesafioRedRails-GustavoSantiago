class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_profile, except: [:edit, :update]

  private
    def verify_profile
      if user_sign_in? && current_user.profile.nil?
        redirect_to edit_user_path(current_user)
      end
    end
end
