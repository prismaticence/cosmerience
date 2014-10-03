class User < ActiveRecord::Base
	has_many :reviews
	has_many :comments
	has_secure_password
    validates_confirmation_of :password

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "40x40>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  	before_create :set_slug


  def set_slug
    self.slug = generate_slug
  end

  def generate_slug
      str = self.username
      str = str.gsub /\W/, "-"
      str = str.downcase 

      count = 2

      slugger = User.find_by slug: str

      while !slugger.blank? && slugger != self
        tempstr = str + "-" + count.to_s
        slugger = User.find_by slug: tempstr
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