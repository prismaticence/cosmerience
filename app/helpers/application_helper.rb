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

   def nested_comments(comments)
     comments.map do |comment, sub_comments|
 	
       render(comment) + content_tag(:div, nested_comments(sub_comments), :class => "nested_comments")
     
       end.join.html_safe
  
    
   end


end
