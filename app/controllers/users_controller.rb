class UsersController < ApplicationController
	def new
		if @is_logged_in
			redirect_to root_path
		end
		@user = User.new 
	end
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "You signed up successfully"
			flash[:color]= "valid"
			session[:user_id] = @user.id
			redirect_to root_path
		else
			flash[:notice] = "Form is invalid"
			flash[:color]= "invalid"
			render "new"
		end
	end

	def show
		@user = User.find(params[:id])
	end
	
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:notice] = "You updated successfully"
			flash[:color]= "valid"
			redirect_to user_path(@user)
		else
			flash[:notice] = "Form is invalid"
			flash[:color]= "invalid"
			render "update"
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation, :email)
	end
end
