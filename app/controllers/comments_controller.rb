class CommentsController < ApplicationController
	
	def new

		@review = Review.find_by slug: params[:review_id]
		@comment = Comment.new(parent_id: params[:parent_id])

	end

	def create
		if logged_in?
			commentedreview = Review.find_by slug: params[:review_id]
			comment = Comment.create(body: params[:body], user_id: current_user.id, review_id: commentedreview.id, parent_id: params[:parent_id])

			if comment.save
				flash[:notice] = "Your comment was added!"
				redirect_to :back
			else
				flash[:error] = "There was an error"
				redirect_to :back
			end
		else
			flash[:error] = "You need to be logged in to post a comment"
			redirect_to :back
		end
	end
end