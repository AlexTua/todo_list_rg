class UiController < ApplicationController
  before_action :signed_in_user

  def index
  	  @projects=current_user.projects.all
      @tasks=current_user.tasks.all
      @task_new=current_user.tasks.new
  end

  def create 
  	current_user.projects.create!(name: "New list")
    @project=current_user.projects.first
    @tasks=current_user.tasks.all
    @task_new=current_user.tasks.new
  		respond_to do |format|
        format.js
      end
  end

  def destroy
  	current_user.projects.find(params[:id]).destroy
  		respond_to do |format|
        format.js
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
