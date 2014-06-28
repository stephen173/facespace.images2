class UsersController < ApplicationController

  def index
    @users = User.all()
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.email = params[:user][:email]
    user.name = params[:user][:name]
    user.bio = params[:user][:bio]
    user.password = params[:user][:password]
    user.password_confirmation = params[:user][:password_confirmation]
    @user.image = params[:user][:image]
    user.save!
    session[:user_id] = user.id.to_s
    redirect_to '/'
  end

  def show
    @user = User.find(params[:id])
    
    @wallposts = @user.wallposts

    @friends = @user.friends
    
  end

	def new
	
	end

	def create
    user = User.new
    user.email = params[:user][:email]
    user.name = params[:user][:name]
    user.password = params[:user][:password]
    user.password_confirmation = params[:user][:password_confirmation]
    @user.image = params[:user][:image]
    user.save!
    session[:user_id] = user.id.to_s
    redirect_to '/'
	end

  def befriend
    @user = User.find(params[:id])
    @wallposts = @user.wallposts

    #add current user to this users' list of friends (?)
    myself = User.find(session[:user_id])
    
    already_friends = false
    
    #check if you're already friends with this user
    @user.friends.each do |fr|
      if fr.id = myself.id 
        already_friends=true
      end
    end
    
    if already_friends
      flash[:info] = "You are already friends"
    else
      @user.friends << myself
      @user.save

      flash[:success] = "You've got a new friend!"
    end
    
    @friends = @user.friends
    render :show

  end

end