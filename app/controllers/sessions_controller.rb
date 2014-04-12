class SessionsController < ApplicationController
	def login
		if @is_logged_in
			redirect_to root_path
		end
	end

	def login_auth
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:notice] = "Hello, #{authorized_user.username} !"
			redirect_to root_path
		else
			flash[:notice] = "Invalid Username or Password"
			flash[:color]= "invalid"
			render "login"	
		end
	end
	def logout
		session[:user_id] = nil
		redirect_to root_path
	end
end
