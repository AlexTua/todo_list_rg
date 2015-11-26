class TasksController < ApplicationController

	def create
	   current_user.tasks.create!(task_params)
	   @task = current_user.tasks.first
	   	 respond_to do |format|
      		format.js
     	end
	end

	def destroy
		current_user.tasks.find(params[:id]).destroy
		 respond_to do |format|
      	 	format.js
     	end
	end

	def edit
		@task=current_user.tasks.find(params[:id])
		 respond_to do |format|
      	  	format.js
     	end
	end

	def update
		@task=current_user.tasks.find(params[:id])
		@task.update_attributes(:name => params[:name])
		 respond_to do |format|
      	 	format.js
     	end
	end

	private

    def task_params
      params.require(:task).permit(:name, :project_id)
    end
end
