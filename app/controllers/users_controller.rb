class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create 
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
      redirect_to root_url #ajax
  	else 
  		render 'new' #ajax
	  end
  end
end
