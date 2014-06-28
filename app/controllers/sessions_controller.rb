class SessionsController < ApplicationController


  # logout
	def destroy

		session[:user_id] = nil
		# (or session.destroy)
    flash[:success] = "Logged Out!"
		redirect_to '/'
	end

  #login page
	def new

	end

  #execute login
	def create
		user = User.where(email: params[:email]).first
		if user && user.authenticate(params[:password])
      session[:user_id] = user.id.to_s
      flash[:success] = "Logged In!"
      redirect_to '/'
		else
      flash[:danger] = "Invalid Login!"
      redirect_to '/login'
		end
	end

end