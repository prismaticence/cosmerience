class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(userparams)

		if @user.save
			flash[:notice] = "You have successfully registered"
      current_user = @user
      session[:user_id] = @user.id
			redirect_to root_path
		else
			flash[:error] = "There was an error"
			render 'new'
		end
	end
  
  def show
    @user = User.find_by slug: params[:id]
  end
  
	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(userparams)

		if @user.save
			flash[:notice] = "Your profile has been updated"
			redirect_to :back
		else
			flash[:error] = "There was an error"
			redirect_to :back
		end
	end

	private
	def userparams
		params.require(:user).permit!
	end
end