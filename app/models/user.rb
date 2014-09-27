class User < ActiveRecord::Base
	has_many :reviews
	has_many :comments
	has_secure_password
  validates_confirmation_of :password

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "40x40>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end