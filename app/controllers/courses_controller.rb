class CoursesController < ApplicationController
	before_action :authenticate_user!
	before_action :check_state, only: [:show, :edit]
	layout "lesson"

	def index
  		@courses = Course.all.paginate(:page => params[:page],per_page: 10)
  	end

	def new
		@course = Course.new		
	end

	def edit    
		#@course = Course.find(params[:id])
	end


	def create
		@course = Course.new(course_params)

		if @course.save
			@enroll = Enroll.new(course_id: @course.id ,user_id: current_user.id, admin: true)
			if @enroll.save
				redirect_to @course, notice: "El curso #{@course.name} fue creado."
			else
				render enroll, notice: "error al guardar"
			end
		else
			render "new"
		end
	end

	def show
		@course = Course.find(params[:id])
		
		if admin?
			render :show
		else
			render :show_user
		end
  	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy
		redirect_to courses_path, notice: "El curso #{@course.name} fue eliminado"
	end


	def update
		@course = Course.find(params[:id])
		if @course.update(course_params)
		  redirect_to @course, notice: 'El curso fue actualizado de manera exitosa.'        
		else
		  render :edit        
		end

	end

	def enroll
		id_course =  params[:id]
		@enroll = Enroll.new(course_id: id_course ,user_id: current_user.id)
		if @enroll.save
			redirect_to course_path(id_course), notice: "Te has inscrito de manera exitosa"
		else
			render "enroll"
		end		
	end

	private

		def course_params
			params.require(:course).permit(:name, :description, :difficulty, :views, :reputation, :genre, :instrument, :image,
											lessons_attributes: [:title, :description] )
		end


		def check_state
			#puts "I HOPE TO FIND THE ERROR #{params['id']}"
			@course  = Course.find(params['id'])
			@lessons = Lesson.where(course_id: @course.id)			
			if @lessons.size >= 3			
				@course.update(state: "ACTIVO" )
			else
				@course.update(state: "INACTIVO")
			end		
		end
		def admin?
			@enrolls = Enroll.where("course_id = ? AND user_id = ?", params[:id], current_user.id)

			admin = false
			if not @enrolls.empty?
				if @enrolls[0].admin
					admin = true
				end			
			end
			return admin
		end

end
