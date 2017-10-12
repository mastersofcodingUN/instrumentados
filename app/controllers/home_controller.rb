class HomeController < ApplicationController
  layout "welcome_and_home"
  before_action :authenticate_user!
  def show
  	@courses = Course.order(views: :desc).page(params[:page]).per_page(10)
  end
end
