require "application_system_test_case"

class LessonsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit lessons_url
  #
  #   assert_selector "h1", text: "Lesson"
  # end
  setup do
  	visit root_path
  	click_on "INICIAR SESIÓN"

  	fill_in "email", with: "daafonsecara@unal.edu.co"
  	fill_in "password", with: "12345678"
  	click_on "Iniciar sesión"  	
  end

  test "iniciar sesion" do
	assert_selector "p","Descripción: "
  end
end
