class SessionsController < ApplicationController
	def new

	end

	def create

		user = User.find_by(username: params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:success] = "You have successfully logged in"
			redirect_to root_path
		else
			flash[:error] = "Your username or password has an error"
			redirect_to :back
		end

	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You've logged out"
		redirect_to root_path
	end

end