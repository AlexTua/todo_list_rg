class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create 
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
      redirect_to @user #ajax
  	else 
  		render 'new' #ajax
	  end
  end

  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts
  end

   private
    def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
