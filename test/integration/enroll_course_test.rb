require 'test_helper'

class EnrollCourseTest < ActionDispatch::IntegrationTest
  	Devise::Test::ControllerHelpers

  	setup do  		  		
  		@user = User.create(email: "david@mail.com", password: "12345678", password_confirmation: "12345678", confirmed_at: Date.today)  		  	
  		post "/users/sign_in", params: { user: {email: @user.email, password: "12345678" }}  	
  		@course = courses(:one)  		
   	end

	test "ver pdf" do
		get "/home"		
		assert_response  :success
		assert_select "a", "Búsqueda avanzada"
		get "/courses/#{@course.id}"
		assert_select "h3", "Descripción"
		get "/courses/#{@course.id}/generate"
		follow_redirect!
		get "/courses/#{@course.id}/generate.pdf"
		assert_response  :success
	end
end

