class TasksController < ApplicationController

	def index
		@tasks = Task.all
	end
	
	def new
		@task = Task.new
	end
	
	def create
		@task = Task.new(task_params)
    @task.save

    # no need for app/views/tasks/create.html.erb
    redirect_to task_path(@task)
	end

  def show
		@task = Task.find(params[:id])
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # no need for app/views/tasks/update.html.erb
    redirect_to task_path(@task)
	end

	def destroy
    @task = Task.find(params[:id])
    @task.destroy

    # no need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path
  end

	private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
	end
end
