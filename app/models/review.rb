class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :treatment
	has_many :comments

	has_attached_file :photos, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :photos, :content_type => /\Aimage\/.*\Z/
end