class WallpostsController < ApplicationController

  before_filter :check_signed_in 

  def create
    
    #check if users is logged in ?
    
    wallpost = Wallpost.new
    wallpost.post_comment = params[:wallpost][:post_comment]
    wallpost.created = DateTime.now
    wallpost.created_by = session[:user_id]
    wallpost.user_id = params[:wallpost][:user_id]
    wallpost.save
    
    redirect_to "/users/#{wallpost.user_id}"
    
  end
    

end