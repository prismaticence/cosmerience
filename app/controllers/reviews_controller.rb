class ReviewsController < ApplicationController
	def new
    if !logged_in?
      flash[:error] = "You need to log in to write a review"
      redirect_to login_path
    else
		@review = Review.new
		@treatment = Treatment.all
    end
	end

	def create
		@review = Review.new(reviewparams)
		@review.user_id = current_user.id
		if @review.save
			flash[:notice] = "Your review has been saved"
			redirect_to treatments_path
		else
			flash[:error] = "Your review was not saved"
			render 'new'
		end
	end

	def show
		@review = Review.find(params[:id])
	end

	private
	def reviewparams
		params.require(:review).permit!
	end
end