class TreatmentsController < ApplicationController
	def index
		@treatment = Treatment.all
	end

	def show
		@treatment = Treatment.find_by slug: params[:id]
	end
end
