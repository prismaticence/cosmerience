class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
  	current_user ||= User.find_by id: session[:user_id]
  end


  def logged_in?
  	!!current_user
  end

  def set_slug
    self.slug = generate_slug
  end

  def generate_slug
      str = self.username
      str = str.gsub /\W/, "-"
      str = str.downcase 

      count = 2

      slugger = self.class.find_by slug: str

      while slugger 
        str = str + "-" + count.to_s
        slugger = self.class.find_by slug: str
        count += 1
      end
      return slugger
  end
 end