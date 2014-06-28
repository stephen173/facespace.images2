class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :get_current_user
  
  private

  def get_current_user
    @current_user = nil
    if session[:user_id]
      @current_user = User.find(session[:user_id])  
    end
  end
  
  def check_signed_in
	  	if get_current_user.nil?
	  		
	  		flash[:info] = "You must sign in in order to use FaceSpace!"
	  		redirect_to login_path
	  	end
  end
  
  
end
