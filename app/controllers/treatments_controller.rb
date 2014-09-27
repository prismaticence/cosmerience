class TreatmentsController < ApplicationController
	def index
		@treatment = Treatment.all
	end

	def show
		@treatment = Treatment.find(params[:id])
	end
end
