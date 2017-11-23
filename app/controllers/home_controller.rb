class HomeController < ApplicationController
  layout "welcome_and_home"
  before_action :authenticate_user!
  def show
    @find_courses = Course.search(params[:search], params[:genre], params[:instrument]).order("created_at desc").page(params[:page]).per_page(10)
  end

end
