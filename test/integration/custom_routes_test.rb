require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
	test "that /login route opens the login page" do
		get '/login'
		assert_response :success
	end
  	
  	test "that /logout route closes the logout page" do
		get '/logout'
		assert_response :redirect
		assert_redirect_to '/'
	end

	test "that /register route opens the sign up page" do
		get '/register'
		assert_response :success
	end
end
