class WelcomeController < ApplicationController
	def index
		@treatments = Treatment.all
	end
  
  def contact
  
  end
  
  def about
  
  end
end