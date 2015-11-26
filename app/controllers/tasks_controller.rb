class TasksController < ApplicationController

	def create
	   current_user.tasks.create!(task_params)
	   @task = current_user.tasks.first
	   	respond_to do |format|
      	  format.js
     	end
	end

	private

    def task_params
      params.require(:task).permit(:name, :project_id)
    end
end
