class SessionsController < ApplicationController
  skip_before_action :verify_profile
end