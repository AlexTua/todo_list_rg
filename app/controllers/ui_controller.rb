class UiController < ApplicationController
  before_action :signed_in_user

  def index
  	  @projects=current_user.projects.all;
  end

  def create 
  	if current_user.projects.create!(name: "New list")
    @project=current_user.projects.first
  		respond_to do |format|
        format.js
      end
  	end
  end

  def destroy
  	if current_user.projects.find(params[:id]).destroy
  		respond_to do |format|
        format.js
      end
  	end
  end

  def edit
    @project=current_user.projects.find(params[:id])
      respond_to do |format|
        format.js
      end
  end
  
  def update
    @project=current_user.projects.find(params[:id])
    @project.update_attributes(:name => params[:name])
     respond_to do |format|
        format.js
     end
  end
end
