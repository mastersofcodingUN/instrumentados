class ResourcesController < ApplicationController

  layout "resource"
  before_action :authenticate_user!

  def index
  	@resources = Resource.returnAll
    puts @resources
  end

  def new
  	@resource = Resource.new
  end

  def create
  	@resource = Resource.new(resource_params)

  	if @resource.save
  		redirect_to resources_path, notice: "El recurso #{@resource.name} fue cargado."
  	else
  		render "new"
  	end
  end

  def destroy
  	@resource = Resource.finding(params[:id])
  	@resource.destroy
  	redirect_to @resource.lesson, notice: "El recurso #{@resource.name} fue eliminado"
  end

  private
  	def resource_params
      params.require(:resource).permit(:name, :attachment)
  	end
end
