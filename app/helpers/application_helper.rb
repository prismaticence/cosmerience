module ApplicationHelper
	def options_for_treatment
		bigarr = []
		@treatment.each do |treatment|
			arr = [treatment.name, treatment.id]
			bigarr << arr
		end
			return bigarr
	end


	def daymonthyear(dt)
		dt.strftime("%e %B %Y")
	end

end
