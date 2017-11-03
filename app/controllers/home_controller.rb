class HomeController < ApplicationController
  layout "welcome_and_home"
  before_action :authenticate_user!
  def show
  	@courses = Course.order(views: :desc).page(params[:page]).per_page(10)
    @find_courses = Course.search(params[:search], params[:genre], params[:instrument])
  end

  def filter_by_genre(gen)
 	@courses  = Course.filter_by_genre(gen)
 	render :show
  end
end
