class WelcomeController < ApplicationController
  layout "welcome_and_home"
    def index
      if user_signed_in?
        redirect_to home_path
      end
    end
end
