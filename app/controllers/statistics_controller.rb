class StatisticsController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def generate
	  respond_to do |format|
	    format.pdf { render template: 'statistics/estadisticas', pdf:'Estadisticas', javascript_delay: 7000, page_height:"12cm", page_width:"20cm", disposition: "attachment"}
    end
  end
end
