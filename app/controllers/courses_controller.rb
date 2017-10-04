class CoursesController < ApplicationController
	before_action :authenticate_user!
	layout "lesson"

	def index
  		@courses = Course.all
  	end

	def new
		@course = Course.new
		@course.lessons.new
	end

	def edit    
		@course = Course.find(params[:id])
	end


	def create
		@course = Course.new(course_params)

		if @course.save
			redirect_to @course, notice: "El curso #{@course.name} fue creado."
		else
			render "new"
		end
	end

	def show
		@course = Course.find(params[:id])
  	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy
		redirect_to courses_path, notice: "El curso #{@course.name} fue eliminado"
	end


	def update

		if @course.update(course_params)
		  redirect_to @course, notice: 'El curso fue actualizado de manera exitosa.'        
		else
		  render :edit        
		end

	end

	private

		def course_params
			params.require(:course).permit(:name, :description, :difficulty, :views, :reputation, :genre, :instrument, :image,
											lessons_attributes: [:title, :description] )
		end

end
