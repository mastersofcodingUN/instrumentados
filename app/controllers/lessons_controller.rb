class LessonsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  layout "lesson"
  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
    @lesson.course_id = params[:course_id]
    #@lesson.resources.new
    #@course = Course.find(params[:course_id])
    #@lesson = @course.lessons.new
    @lesson.resources.new

  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  def create
    @lesson = Lesson.new(lesson_params)
    @course_id = lesson_params['course_id']
    #@lesson.course_id = course_id

    if @lesson.save
      redirect_to course_path(@lesson.course_id), notice: 'Lesson was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lessons/1
  def update

    if @lesson.update(lesson_params)
      redirect_to @lesson, notice: 'Lesson was successfully updated.'
    else
      render :edit
    end

  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:title, :description, :course_id, resources_attributes: [:name, :attachment])
    end
end
