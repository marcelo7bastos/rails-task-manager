class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  # We cannot save data without using Strong Params
  # If we dont use Strong PArams: Will raise ActiveModel::ForbiddenAttributesError
  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  # We cannot save data without using Strong Params
  # If we dont use Strong PArams: Will raise ActiveModel::ForbiddenAttributesError
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
        
    # no need for app/views/restaurants/update.html.erb
    redirect_to task_path(@task)
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
