class Treatment < ActiveRecord::Base
	has_many :reviews
	before_create :set_slug

  def set_slug
    self.slug = generate_slug
  end

  def generate_slug
      str = self.name
      str = str.gsub /\W/, "-"
      str = str.downcase 

      count = 2

      slugger = Treatment.find_by slug: str

      while !slugger.blank? && slugger != self
        tempstr = str + "-" + count.to_s
        slugger = Treatment.find_by slug: tempstr
        count += 1
      end

      if count == 2
      	return str
      else
  		return tempstr
  	  end
  end

  
  def to_param
  	self.slug
  end
end