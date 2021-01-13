class ApplicationController < ActionController::Base
  # method that comes with devise that check if the user is logged in
    before_action :authenticate_user!
end
