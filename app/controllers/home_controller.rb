class HomeController < ApplicationController
  layout "welcome_and_home"
  before_action :authenticate_user!
  def show
  	@courses = Course.all
  end
end
