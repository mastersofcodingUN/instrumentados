class CoursesController < ApplicationController
	before_action :authenticate_user!
	before_action :check_state, only: [:show, :edit]
	layout "lesson"

	def generate
		@course = Course.finding(params[:id]) #variable para la información en el pdf
		@user = current_user #usuario actual
	  respond_to do |format|
			format.html { redirect_to "/courses/#{params[:id]}/generate.pdf", form:{target: "_blank"}}
	    format.pdf { render template: 'courses/certificado', pdf:'Certificado', page_height:"14cm", page_width:"20cm", margin:{ top: '3mm', bottom: '3mm', left: '3mm', right: '3mm'}}
	  end
	end

	def index
		@courses = Course.joinWithEnroll(:enrolls).searchUser("user_id = ? AND admin = ?",current_user.id, true).paginate(:page => params[:page],per_page: 10)
	end

	def new
		@course = Course.new
	end

	def edit
		if not admin?
			render "show_user"
		end
		@course = Course.finding(params[:id])
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
		@course = Course.finding(params[:id])
		@course.views = @course.views+1
		@course.save

		if admin?
			render :show
		else
			render :show_user
		end
  	end

	def destroy
		@course = Course.finding(params[:id])
		@course.destroy
		redirect_to courses_path, notice: "El curso #{@course.name} fue eliminado"
	end


	def update
		@course = Course.finding(params[:id])
		if @course.update(course_params)
		  redirect_to @course, notice: 'El curso fue actualizado de manera exitosa.'
		else
		  render :edit
		end

	end

	def enroll
		@course = Course.find(params[:id])
		@enroll = Enroll.new(course_id: @course.id ,user_id: current_user.id)
		if @enroll.save
			UserMailer.delay(run_at: 1.minutes.from_now, attempts: 5).notifier(current_user,@enroll,@course)
			redirect_to course_path(@course.id ), notice: "Te has inscrito de manera exitosa"
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
			@course  = Course.finding(params[:id])
			@lessons = Lesson.search(course_id: @course.id)
			if @lessons.size >= 3
				@course.update(state: "ACTIVO" )
			else
				@course.update(state: "INACTIVO")
			end
		end

		def admin?
			@enrolls = Enroll.searchingRoll("course_id = ? AND user_id = ?", params[:id], current_user.id)

			admin = false
			if not @enrolls.empty?
				if @enrolls[0].admin
					admin = true
				end
			end
			return admin
		end

end
