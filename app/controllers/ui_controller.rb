class UiController < ApplicationController
  before_action :signed_in_user

  def index
  	  @projects=current_user.projects.all;
  end

  def create 
  	if current_user.projects.create!(name: "New list")
  		redirect_to root_url
  	end
  end

  def destroy
  	if current_user.projects.find(params[:id]).destroy
  		redirect_to root_url
  	end
  end

  def edit
    @list=current_user.projects.find(params[:id])
      respond_to do |format|
        format.js
      end
  end
  
  def update
    @list=current_user.projects.find(params[:id])
    @list.update_attributes(:name => params[:name])
    redirect_to root_url

  end
end
