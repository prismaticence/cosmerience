class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :treatment
	has_many :comments, dependent: :destroy
	before_create :set_slug

	has_attached_file :photos, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :photos, :content_type => /\Aimage\/.*\Z/


  	def set_slug
    	self.slug = generate_slug
    end

     def generate_slug
      str = self.title
      str = str.gsub /\W/, "-"
      str = str.downcase 

      count = 2

      slugger = Review.find_by slug: str

      while !slugger.blank? && slugger != self
        tempstr = str + "-" + count.to_s
        slugger = Review.find_by slug: tempstr
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