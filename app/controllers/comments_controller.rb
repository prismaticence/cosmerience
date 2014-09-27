class CommentsController < ApplicationController
	def create
	
		comment = Comment.create(body: params[:body], user_id: current_user.id, review_id: params[:review_id])

		if comment.save
			flash[:notice] = "Your comment was added!"
			redirect_to :back
		else
			flash[:error] = "There was an error"
			redirect_to :back
		end
	end
end