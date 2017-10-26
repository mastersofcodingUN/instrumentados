class SearchesController < ApplicationController
  def show
    @find_courses = Course.search(params[:search])
  end
end
