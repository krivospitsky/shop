class AuthController < ApplicationController
	http_basic_authenticate_with name: ADMIN_NAME password: ADMIN_PASSWORD
	def index
		session[:is_admin?]=true
		redirect_to categories_path
	end
end
