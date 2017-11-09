require 'test_helper'

class LessonsControllerTest < ActionDispatch::IntegrationTest
  Devise::Test::ControllerHelpers

  setup do
    #@user = User.create(email: "david@mail.com", encrypted_password: Devise::Encryptor.digest(User, "12345678"))
    #post "/users/sign_in", params:  { email: @user.email, password: '12345678'}
    #assert_response :success
    @course = Course.create(
      name:"Fundamentos de trompeta",
      description: "Descripcion del curso de prueba",
      reputation: 2, 
      difficulty: "Principiante",
      views: 50,
      genre: "rock" )
    @lesson = Lesson.create(title:"t1", description:"leccion de trempeta", course_id: @course)
    @lesson2 = Lesson.create(title:"t1", description:"leccion de trempeta", course_id: @course)
    #@course.update(lessons: [@lesson,@lesson2])
  end

  test "should get index" do  
    get course_lessons_url(@course)   
    assert_response :success
  end

  test "should get new" do
    get new_course_lesson_url(@course)
    follow_redirect!
    assert_select "p", "Description:"
    assert_response :success
  end

  test "should create lesson" do
    assert_difference('Lesson.count') do
      post course_lessons_url, params: { lesson: { description: @lesson.description, title: @lesson.title } }
    end

    assert_redirected_to course_lesson_url(Lesson.last)
  end

  test "should show lesson" do
    get course_lesson_url(@lesson.course,@lesson)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_lesson_url(@lesson.course, @lesson)
    assert_response :success
  end

  test "should update lesson" do
    patch lesson_url(@lesson), params: { lesson: { description: @lesson.description, title: @lesson.title } }
    assert_redirected_to lesson_url(@lesson)
  end

  test "should destroy lesson" do
    assert_difference('Lesson.count', -1) do
      delete lesson_url(@lesson)
    end

    assert_redirected_to lessons_url
  end
end
